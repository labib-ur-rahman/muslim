import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shirahsoft_muslim/core/l10n/app_localizations.dart';
import 'package:shirahsoft_muslim/features/settings/presentation/providers/app_settings_provider.dart';

class FontSizeDialog extends ConsumerWidget {
  const FontSizeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontSize = ref.watch(appSettingsProvider).adkarFontSize;
    final l10n = AppLocalizations.of(context)!;

    return SimpleDialog(
      title: Text(
        l10n.settings_adkar_font_size,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold,
        ),
      ),
      contentPadding: EdgeInsets.all(20.r),
      children: [
        Text(
          l10n.settings_adkar_font_size_dialog_subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.sp, fontFamily: "Cairo"),
        ),
        SizedBox(height: 20.h),
        Slider(
          value: fontSize,
          min: 18.0,
          max: 40.0,
          divisions: 22,
          label: fontSize.round().toString(),
          onChanged: (value) {
            ref.read(appSettingsProvider.notifier).setAdkarFontSize(value);
          },
        ),
        SizedBox(height: 10.h),
        Text(
          "بِسمِ اللَّهِ الرَّحمٰنِ الرَّحيمِ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize.sp, fontFamily: "Naskh"),
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                ref.read(appSettingsProvider.notifier).setAdkarFontSize(24);
              },
              child: Text(
                l10n.settings_reset_settings_confirm,
                style: const TextStyle(fontFamily: "Cairo"),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                l10n.settings_done,
                style: const TextStyle(fontFamily: "Cairo"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
