import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shirahsoft_muslim/core/extensions/color_ext.dart';
import 'package:shirahsoft_muslim/core/l10n/app_localizations.dart';
import 'package:shirahsoft_muslim/features/settings/presentation/providers/app_settings_provider.dart';

class CalculationMethodDialog extends ConsumerWidget {
  const CalculationMethodDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMethod = ref.watch(appSettingsProvider).calculationMethodIndex;
    final l10n = AppLocalizations.of(context)!;

    final List<String> methods = [
      l10n.settings_calc_auto,
      l10n.settings_calc_mwl,
      l10n.settings_calc_umm_al_qura,
      l10n.settings_calc_egypt,
      l10n.settings_calc_karachi,
      l10n.settings_calc_turkey,
      l10n.settings_calc_dubai,
      l10n.settings_calc_moon_sighting,
      l10n.settings_calc_isna,
      l10n.settings_calc_kuwait,
      l10n.settings_calc_qatar,
      l10n.settings_calc_singapore,
      l10n.settings_calc_tehran,
    ];

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Hero(
                  tag: "timer",
                  child: Icon(
                    Icons.timer,
                    color: context.color.onSurface,
                    size: 25.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  l10n.settings_calculation_method,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(color: context.color.onSurface.withValues(alpha: .1)),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: calculatNames(methods, currentMethod, context, ref),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Divider(color: context.color.onSurface.withValues(alpha: .1)),
            TextButton(
              style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                foregroundColor: WidgetStatePropertyAll<Color>(
                  context.color.onSurface,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                l10n.settings_cancel,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> calculatNames(
    List<String> methods,
    int currentMethod,
    BuildContext context,
    WidgetRef ref,
  ) {
    return List.generate(methods.length, (index) {
      final bool isSelected = currentMethod == index;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected
              ? context.color.primary.withValues(alpha: .12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: isSelected
              ? Border.all(
                  color: context.color.primary.withValues(alpha: .4),
                  width: 1.5,
                )
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: ListTile(
            title: Text(
              methods[index],
              style: TextStyle(
                fontFamily: "Cairo",
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
            ),
            trailing: isSelected
                ? Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: () async {
              await ref
                  .read(appSettingsProvider.notifier)
                  .setCalculationMethod(index);
              if (!context.mounted) return;
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(
                      context,
                    )!.settings_calculation_method_updated,
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
