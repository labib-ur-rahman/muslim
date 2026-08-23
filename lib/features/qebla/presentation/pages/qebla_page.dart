import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shirahsoft_muslim/core/common/providers/user_position_provider.dart';
import 'package:shirahsoft_muslim/core/extensions/color_ext.dart';
import 'package:shirahsoft_muslim/core/l10n/app_localizations.dart';
import 'package:shirahsoft_muslim/features/qebla/presentation/providers/qibla_provider.dart';
import 'package:shirahsoft_muslim/features/qebla/presentation/widgets/qibla_compass_painter.dart';
import 'package:shirahsoft_muslim/app_bootstrap.dart';

class QeblaPage extends ConsumerStatefulWidget {
  const QeblaPage({super.key});

  @override
  ConsumerState<QeblaPage> createState() => _QeblaPageState();
}

class _QeblaPageState extends ConsumerState<QeblaPage>
    with WidgetsBindingObserver {
  bool _isAligned = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Geolocator.checkPermission().then((permission) {
        if (permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always) {
          _requestLocation();
        }
      });
    }
  }

  void _checkAlignment(double heading, double qiblaAngle) {
    double diff = (heading - qiblaAngle).abs();
    if (diff > 180) {
      diff = 360 - diff;
    }

    // يعتبر متطابقاً إذا كان الفرق أقل من أو يساوي درجتين
    final isNowAligned = diff <= 2.0;

    if (isNowAligned && !_isAligned) {
      HapticFeedback.heavyImpact(); // اهتزاز عند المطابقة
      if (mounted) setState(() => _isAligned = true);
    } else if (!isNowAligned && _isAligned) {
      if (mounted) setState(() => _isAligned = false);
    }
  }

  /// يُطلق طلب الإذن ثم يُحدّث الموضع في المزود
  Future<void> _requestLocation() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      return;
    }

    if (!mounted) return;
    final error = await AppBootstrap.initLocationAndPrayers(
      context: context,
      container: ProviderScope.containerOf(context),
    );
    if (error != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error, style: const TextStyle(fontFamily: 'Cairo')),
          backgroundColor: Colors.red.shade700,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final qiblaEntity = ref.watch(qiblaEntityProvider);
    final compassSupport = ref.watch(compassSupportProvider);
    final position = ref.watch(userPositionProvider);

    // متابعة البوصلة لمعرفة التوافق مع القبلة لأجل الاهتزاز
    ref.listen<AsyncValue<double?>>(compassStreamProvider, (previous, next) {
      final h = next.value;
      if (h != null && qiblaEntity != null) {
        _checkAlignment(h, qiblaEntity.qiblaAngle);
      }
    });

    return Scaffold(
      backgroundColor: context.color.surfaceContainerLowest,
      body: SafeArea(
        child: Column(
          children: [
            const _QiblaHeader(),
            Expanded(
              child: compassSupport.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, _) => _buildNoSensorState(context),
                data: (hasCompass) {
                  if (!hasCompass) return _buildNoSensorState(context);
                  if (position == null) return _buildNoLocationState(context);
                  if (qiblaEntity == null) {
                    return _buildNoLocationState(context);
                  }

                  return _buildCompassBody(
                    context,
                    qiblaEntity.qiblaAngle,
                    qiblaEntity.distanceKm,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ──────────────────────────────────────────────────────────
  // الواجهة الرئيسية — البوصلة
  // ──────────────────────────────────────────────────────────

  Widget _buildCompassBody(
    BuildContext context,
    double qiblaAngle,
    double distanceKm,
  ) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 28.h),
      child: Column(
        children: [
          _buildMagneticWarning(context),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 20.h),
            decoration: BoxDecoration(
              color: context.color.surface,
              borderRadius: BorderRadius.circular(28.r),
              border: Border.all(color: context.color.outlineVariant),
              boxShadow: [
                BoxShadow(
                  color: context.color.shadow.withValues(alpha: .06),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Consumer(
              builder: (context, ref, _) {
                final heading = ref.watch(compassStreamProvider).value;
                if (heading == null) return _buildCompassPlaceholder(context);
                return _CompassWidget(
                  needleAngleRad: qiblaAngle * (math.pi / 180.0),
                  qiblaAngle: qiblaAngle,
                  heading: heading,
                  isAligned: _isAligned,
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          _buildInfoRow(context, qiblaAngle, distanceKm),
          SizedBox(height: 16.h),
          _buildCalibrationTip(context),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────────────────────
  // تحذير المجالات المغناطيسية
  // ──────────────────────────────────────────────────────────

  Widget _buildMagneticWarning(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: context.color.secondaryContainer.withValues(alpha: .55),
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: context.color.secondary.withValues(alpha: .28),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: context.color.onSecondaryContainer,
            size: 25.sp,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              l10n.qibla_magnetic_warning,
              style: TextStyle(
                fontSize: 13.sp,
                height: 1.6,
                fontWeight: FontWeight.w600,
                color: context.color.onSecondaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────────────────────
  // صف المعلومات الإضافية
  // ──────────────────────────────────────────────────────────

  Widget _buildInfoRow(
    BuildContext context,
    double qiblaAngle,
    double distanceKm,
  ) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: _buildInfoChip(
            context,
            icon: Icons.explore_rounded,
            label: l10n.qibla_angle_label,
            value: '${qiblaAngle.toStringAsFixed(1)}°',
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _buildInfoChip(
            context,
            icon: Icons.route_rounded,
            label: l10n.qibla_distance_label,
            value: l10n.qibla_distance_km(distanceKm.toStringAsFixed(0)),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoChip(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: context.color.outlineVariant),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: context.color.secondaryContainer,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              icon,
              color: context.color.onSecondaryContainer,
              size: 20.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: context.color.onSurface,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: context.color.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalibrationTip(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.color.surfaceContainerLow,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        children: [
          Icon(Icons.screen_rotation_alt_rounded, color: context.color.primary),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              l10n.qibla_calibration_tip,
              style: TextStyle(
                fontSize: 13.sp,
                height: 1.6,
                color: context.color.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────────────────────
  // حالة تحميل البوصلة
  // ──────────────────────────────────────────────────────────

  Widget _buildCompassPlaceholder(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SizedBox(
      width: 280.w,
      height: 280.w,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: context.color.primary),
            SizedBox(height: 16.h),
            Text(
              l10n.qibla_compass_loading,
              style: TextStyle(fontFamily: 'Cairo', fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }

  // ──────────────────────────────────────────────────────────
  // حالة عدم وجود بوصلة
  // ──────────────────────────────────────────────────────────

  Widget _buildNoSensorState(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sensors_off_outlined,
              size: 72.sp,
              color: context.color.onSurface.withValues(alpha: .3),
            ),
            SizedBox(height: 24.h),
            Text(
              l10n.qibla_no_sensor_title,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: context.color.onSurface,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              l10n.qibla_no_sensor_subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 14.sp,
                color: context.color.onSurface.withValues(alpha: .55),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ──────────────────────────────────────────────────────────
  // حالة عدم وجود موقع
  // ──────────────────────────────────────────────────────────

  Widget _buildNoLocationState(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_off_outlined,
              size: 72.sp,
              color: context.color.onSurface.withValues(alpha: .3),
            ),
            SizedBox(height: 24.h),
            Text(
              l10n.qibla_no_location_title,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: context.color.onSurface,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              l10n.qibla_no_location_subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 14.sp,
                color: context.color.onSurface.withValues(alpha: .55),
                height: 1.6,
              ),
            ),
            SizedBox(height: 28.h),
            FilledButton.icon(
              onPressed: _requestLocation,
              icon: const Icon(Icons.my_location_rounded),
              label: Text(
                l10n.qibla_find_my_location,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QiblaHeader extends StatelessWidget {
  const _QiblaHeader();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 8.h),
      child: Row(
        children: [
          IconButton.filledTonal(
            tooltip: l10n.go_back,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
          SizedBox(width: 10.w),
          Container(
            width: 46.r,
            height: 46.r,
            decoration: BoxDecoration(
              color: scheme.secondaryContainer,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Icon(
              Icons.explore_rounded,
              color: scheme.onSecondaryContainer,
              size: 25.sp,
            ),
          ),
          SizedBox(width: 11.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.qebla_direction,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    color: scheme.onSurface,
                  ),
                ),
                Text(
                  l10n.qibla_header_subtitle,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 10.5.sp,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// ويدجت البوصلة الداخلي
// ──────────────────────────────────────────────────────────────────────────────

class _CompassWidget extends StatelessWidget {
  final double needleAngleRad;
  final double qiblaAngle;
  final double heading;
  final bool isAligned; // To highlight compass when aligned

  const _CompassWidget({
    required this.needleAngleRad,
    required this.qiblaAngle,
    required this.heading,
    required this.isAligned,
  });

  @override
  Widget build(BuildContext context) {
    final qiblaColor = isAligned
        ? context.color.primary
        : context.color.secondary;
    final ringColor = Theme.of(context).colorScheme.onSurface;
    final labelColor = Theme.of(context).colorScheme.onSurface;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        // -- مؤشر الاتجاه النصي --
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
          decoration: BoxDecoration(
            color: isAligned
                ? context.color.primaryContainer
                : context.color.surfaceContainerLow,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            isAligned ? l10n.qibla_aligned : _headingLabel(l10n, heading),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
              color: isAligned
                  ? context.color.onPrimaryContainer
                  : context.color.onSurfaceVariant,
            ),
          ),
        ),

        SizedBox(height: 16.h),

        // -- البوصلة --
        Transform.rotate(
          angle: -heading * (math.pi / 180.0),
          child: SizedBox(
            width: 260.w,
            height: 260.w,
            child: CustomPaint(
              painter: QiblaCompassPainter(
                needleAngleRad: needleAngleRad,
                qiblaColor: qiblaColor,
                ringColor: ringColor,
                labelColor: labelColor,
              ),
            ),
          ),
        ),

        SizedBox(height: 20.h),

        // -- badge القبلة --
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: context.color.secondaryContainer,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: qiblaColor.withValues(alpha: .35)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.mosque_rounded, color: qiblaColor, size: 18.sp),
              SizedBox(width: 6.w),
              Text(
                l10n.qebla_direction,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: context.color.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _headingLabel(AppLocalizations l10n, double heading) {
    final h = heading % 360;
    final degrees = h.toStringAsFixed(0);
    if (h < 22.5 || h >= 337.5) return l10n.qibla_heading_north(degrees);
    if (h < 67.5) return l10n.qibla_heading_north_east(degrees);
    if (h < 112.5) return l10n.qibla_heading_east(degrees);
    if (h < 157.5) return l10n.qibla_heading_south_east(degrees);
    if (h < 202.5) return l10n.qibla_heading_south(degrees);
    if (h < 247.5) return l10n.qibla_heading_south_west(degrees);
    if (h < 292.5) return l10n.qibla_heading_west(degrees);
    return l10n.qibla_heading_north_west(degrees);
  }
}
