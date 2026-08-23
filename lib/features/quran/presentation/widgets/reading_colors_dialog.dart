import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shirahsoft_muslim/core/common/providers/theme_provider.dart';
import 'package:shirahsoft_muslim/core/extensions/color_ext.dart';
import 'package:shirahsoft_muslim/core/extensions/sizes_ext.dart';
import 'package:shirahsoft_muslim/core/l10n/app_localizations.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/providers/quran_settings_provider.dart';

class ReadingColorModel {
  final String name;
  final Color color;

  ReadingColorModel({required this.name, required this.color});
}

class ReadingColorsDialog extends ConsumerWidget {
  const ReadingColorsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeMode = ref.watch(themeProvider);
    final settings = ref.watch(quranSettingsProvider);
    final l10n = AppLocalizations.of(context)!;

    final isDark =
        themeMode == ThemeMode.dark || theme.brightness == Brightness.dark;

    // تحديد الألوان المناسبة بناءً على الوضع الحالي للتطبيق
    final List<ReadingColorModel> colors = isDark
        ? [
            ReadingColorModel(
              name: l10n.quran_color_dark_default,
              color: const Color(0xFF1E1E1E),
            ), // الاساسي القديم
            ReadingColorModel(
              name: l10n.quran_color_night_black,
              color: const Color(0xFF000000),
            ), // أسود مطفي كامل
            ReadingColorModel(
              name: l10n.quran_color_dark_sepia,
              color: const Color(0xFF2C241B),
            ), // سيبيا مهيأة للوضع الداكن
            ReadingColorModel(
              name: l10n.quran_color_dark_blue,
              color: const Color(0xFF111A22),
            ), // لون أزرق ليلي مريح للعين
          ]
        : [
            ReadingColorModel(
              name: l10n.quran_color_light_sepia,
              // تم تعميق لون السيبيا قليلاً ليكون دافئاً وواضحاً كخيار ليلي مريح
              color: const Color(0xFFEBDABF),
            ),
            ReadingColorModel(
              name: l10n.quran_color_bright_white,
              // يبقى كما هو لأنه المرجع الأساسي للسطوع
              color: const Color(0xFFFFFFFF),
            ),
            ReadingColorModel(
              name: l10n.quran_color_soft_gray,
              // تم تقليل السطوع قليلاً ليميزه المستخدم فوراً عن الأبيض
              color: const Color(0xFFE0E0E0),
            ),
            ReadingColorModel(
              name: l10n.quran_color_light_cream,
              // جعلناه يميل أكثر للصفرة الهادئة ليميزه المستخدم عن الرمادي والسيبيا
              color: const Color(0xFFFFF9E3),
            ),
          ];

    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: context.color.surfaceContainerLowest,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.quran_settings_reading_bg_color,
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            height: 80.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              separatorBuilder: (context, index) =>
                  SizedBox(width: context.mediaQueryWidth * 0.09),
              itemBuilder: (context, index) {
                final colorModel = colors[index];
                final isSelected =
                    settings.readingBackgroundColorIndex == index;

                return GestureDetector(
                  onTap: () {
                    ref
                        .read(quranSettingsProvider.notifier)
                        .setReadingBackgroundColorIndex(index);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 50.r,
                        height: 50.r,
                        decoration: BoxDecoration(
                          color: colorModel.color,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.outlineVariant,
                            width: isSelected ? 3 : 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: .1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: isSelected
                            ? Icon(
                                Icons.check,
                                color: _getContrastColor(colorModel.color),
                              )
                            : null,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        colorModel.name,
                        style: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 12.sp,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  // دالة مساعدة لتحديد لون علامة الصح لتكون واضحة
  Color _getContrastColor(Color color) {
    return color.computeLuminance() > 0.5 ? Colors.black87 : Colors.white;
  }
}
