import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shirahsoft_muslim/core/common/providers/theme_provider.dart';
import 'package:shirahsoft_muslim/core/extensions/color_ext.dart';
import 'package:shirahsoft_muslim/core/l10n/app_localizations.dart';
import 'package:shirahsoft_muslim/features/settings/presentation/providers/app_settings_provider.dart';

class MadhabDialog extends ConsumerWidget {
  const MadhabDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMadhab = ref.watch(appSettingsProvider).madhabIndex;
    final l10n = AppLocalizations.of(context)!;

    final List<String> madhabs = [
      l10n.settings_madhab_auto_standard,
      l10n.settings_madhab_hanafi,
    ];
    final ThemeMode themeMode = ref.watch(themeProvider);
    final bool isDark = themeMode == ThemeMode.dark;

    return Dialog(
      // backgroundColor: context.color.surface,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Hero(
                  tag: "mosque",
                  child: Icon(
                    Icons.mosque_rounded,
                    color: isDark
                        ? context.color.onSurface.withValues(alpha: .95)
                        : context.color.scrim.withValues(alpha: .8),
                    size: 25.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  l10n.settings_madhab_asr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(color: context.color.onSurface.withValues(alpha: .1)),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(madhabs.length, (index) {
                  final bool isSelected = currentMadhab == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    // margin: EdgeInsets.symmetric(
                    //   horizontal: 8.w,
                    //   vertical: 4.h,
                    // ),
                    // padding: EdgeInsets.symmetric(
                    //   horizontal: 16.w,
                    //   vertical: 14.h,
                    // ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? context.color.primary.withValues(alpha: .12)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.r),
                      border: isSelected
                          ? Border.all(
                              color: context.color.primary.withValues(
                                alpha: .4,
                              ),
                              width: 1.5,
                            )
                          : null,
                    ),
                    child: ListTile(
                      title: Text(
                        madhabs[index],
                        style: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 14.sp,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
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
                      onTap: () {
                        ref.read(appSettingsProvider.notifier).setMadhab(index);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.settings_madhab_updated)),
                        );
                      },
                    ),
                  );
                }),
              ),
            ),
            const Divider(),
            TextButton(
              style: ButtonStyle(
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
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
