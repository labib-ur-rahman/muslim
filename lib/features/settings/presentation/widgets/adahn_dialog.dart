import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shirahsoft_muslim/core/extensions/color_ext.dart';
import 'package:shirahsoft_muslim/core/extensions/sizes_ext.dart';
import 'package:shirahsoft_muslim/core/l10n/app_localizations.dart';

class AdahnDialog extends StatefulWidget {
  const AdahnDialog({super.key});

  @override
  State<AdahnDialog> createState() => _AdahnDialogState();
}

class _AdahnDialogState extends State<AdahnDialog> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final options = [
      l10n.settings_adhan_makkah,
      l10n.settings_adhan_madinah,
      l10n.settings_adhan_aqsa,
      l10n.settings_adhan_egypt_refaat,
      l10n.settings_adhan_egypt_abdul_basit,
      l10n.settings_adhan_umayyad,
      l10n.settings_adhan_hijaz,
      l10n.settings_adhan_rast,
      l10n.settings_adhan_saba,
      l10n.settings_adhan_maghribi,
    ];

    return Dialog(
      child: Padding(
        padding: EdgeInsetsGeometry.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.multitrack_audio_sharp,
                  color: context.color.onSurface,
                ),
                SizedBox(width: 8.w),
                Text(
                  l10n.settings_adhan_sound,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  l10n.settings_in_progress,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: context.mediaQueryHeight * 0.5,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    options.length,
                    (index) => Column(
                      children: [
                        ListTile(
                          title: Text(
                            options[index],
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
