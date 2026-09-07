import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shirahsoft_muslim/core/common/widgets/settings_card.dart';
import 'package:shirahsoft_muslim/core/common/widgets/settings_container.dart';
import 'package:shirahsoft_muslim/core/constants/routes.dart';
import 'package:shirahsoft_muslim/core/extensions/color_ext.dart';
import 'package:shirahsoft_muslim/core/extensions/sizes_ext.dart';
import 'package:shirahsoft_muslim/core/l10n/app_localizations.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/providers/audio_player_provider.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/widgets/quran_view_type_dialog.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/widgets/select_qari_dialog.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/widgets/ayah_delay_dialog.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/widgets/reading_colors_dialog.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/providers/quran_settings_provider.dart';
import 'package:shirahsoft_muslim/core/common/providers/theme_provider.dart';

class QuranSettingsPage extends ConsumerStatefulWidget {
  const QuranSettingsPage({super.key});

  @override
  ConsumerState<QuranSettingsPage> createState() => _QuranSettingsPageState();
}

class _QuranSettingsPageState extends ConsumerState<QuranSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(quranSettingsProvider);
    final currentSelectedQariProvider = ref.watch(selectedQariProvider);
    final themeMode = ref.watch(themeProvider);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark =
        themeMode == ThemeMode.dark || theme.brightness == Brightness.dark;

    final List<Color> currentColorsList = isDark
        ? [
            const Color(0xFF1E1E1E),
            const Color(0xFF000000),
            const Color(0xFF2C241B),
            const Color(0xFF111A22),
          ]
        : [
            const Color(0xFFF5E6D3),
            const Color(0xFFFFFFFF),
            const Color(0xFFF5F5F5),
            const Color(0xFFFAF6EE),
          ];

    final Color selectedColor =
        currentColorsList[settings.readingBackgroundColorIndex.clamp(
          0,
          currentColorsList.length - 1,
        )];

    return Scaffold(
      backgroundColor: context.color.surfaceContainerLowest,
      body: SafeArea(
        child: Column(
          children: [
            const _QuranSettingsHeader(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(context.heightScreen * 0.015),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SettingsContainer(
                        title: l10n.quran_settings_reading_appearance,
                        settingsCards: [
                          SettingCards(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(9),
                            ),
                            icon: const Right(Icons.palette_rounded),
                            text: l10n.quran_settings_reading_bg_color,
                            widget: Container(
                              width: 24.w,
                              height: 24.w,
                              decoration: BoxDecoration(
                                color: selectedColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: context.color.onSurface.withValues(
                                    alpha: 0.4,
                                  ),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) =>
                                    const ReadingColorsDialog(),
                              );
                            },
                          ),
                          SettingCards(
                            icon: const Right(Icons.swipe_vertical_rounded),
                            text: l10n.quran_settings_page_view_type,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    const QuranViewTypeDialog(),
                              );
                            },
                          ),
                          SettingCards(
                            icon: const Right(
                              Icons.screen_lock_rotation_rounded,
                            ),
                            text: l10n.quran_settings_keep_screen_awake,
                            toggle: true,
                            switchValue: settings.keepScreenAwake,
                            onChanged: (_) {
                              ref
                                  .read(quranSettingsProvider.notifier)
                                  .toggleKeepScreenAwake();
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 16.h),
                      SettingsContainer(
                        title: l10n.quran_settings_listening_memorization,
                        settingsCards: [
                          SettingCards(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(9),
                            ),
                            hero: true,
                            heroId: "qari_icon",
                            icon: const Right(Icons.spatial_audio_off),
                            text: l10n.quran_settings_select_qari_voice,
                            subText: currentSelectedQariProvider.name,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const SelectQariDialog();
                                },
                              );
                            },
                          ),
                          SettingCards(
                            icon: const Right(Icons.timer_rounded),
                            text: l10n.quran_settings_ayah_delay,
                            subText: settings.ayahDelaySeconds == 0
                                ? l10n.quran_delay_no_pause
                                : l10n.quran_delay_seconds(
                                    settings.ayahDelaySeconds,
                                  ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => const AyahDelayDialog(),
                              );
                            },
                          ),
                          SettingCards(
                            icon: const Right(
                              Icons.auto_awesome_motion_rounded,
                            ),
                            text: l10n.quran_settings_auto_scroll_audio,
                            toggle: true,
                            switchValue: settings.autoScrollWithAudio,
                            onChanged: (_) {
                              ref
                                  .read(quranSettingsProvider.notifier)
                                  .toggleAutoScrollWithAudio();
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      SettingsContainer(
                        title: l10n.quran_settings_general,
                        settingsCards: [
                          SettingCards(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(9),
                            ),
                            icon: const Right(Icons.library_books_rounded),
                            text: l10n.quran_settings_download_tafsir,
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pushNamed(Routes.tafseerPage);
                            },
                            trallingIcon: Icons.download,
                          ),
                          SettingCards(
                            icon: const Right(
                              Icons.notifications_active_rounded,
                            ),
                            text: l10n.quran_settings_daily_reminders,
                            subText: settings.isDailyReminderEnabled
                                ? (settings.dailyReminderTime != null
                                      ? l10n.quran_reminder_time(
                                          settings.dailyReminderTime!,
                                        )
                                      : l10n.quran_reminder_after_fajr)
                                : l10n.quran_reminder_pick_hint,
                            toggle: true,
                            switchValue: settings.isDailyReminderEnabled,
                            onChanged: (_) {
                              ref
                                  .read(quranSettingsProvider.notifier)
                                  .toggleDailyReminder();
                            },
                            onTap: settings.isDailyReminderEnabled
                                ? () async {
                                    final time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      helpText: l10n.quran_reminder_picker_help,
                                    );
                                    if (time != null) {
                                      final formattedTime =
                                          '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
                                      ref
                                          .read(quranSettingsProvider.notifier)
                                          .setDailyReminderTime(formattedTime);
                                    } else {
                                      ref
                                          .read(quranSettingsProvider.notifier)
                                          .setDailyReminderTime(null);
                                    }
                                  }
                                : null,
                          ),
                        ],
                      ),

                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuranSettingsHeader extends StatelessWidget {
  const _QuranSettingsHeader();

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
              color: scheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Icon(Icons.tune_rounded, color: scheme.onTertiaryContainer),
          ),
          SizedBox(width: 11.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.quran_settings_title,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    color: scheme.onSurface,
                  ),
                ),
                Text(
                  l10n.quran_settings_subtitle,
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
