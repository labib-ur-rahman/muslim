import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shirahsoft_muslim/core/di/injection_container.dart';
import 'package:shirahsoft_muslim/core/l10n/app_localizations.dart';
import 'package:shirahsoft_muslim/core/notification_sound/notification_sound_manager.dart';
import 'package:shirahsoft_muslim/domain/usecases/schedule_notifications_usecase.dart';
import 'package:shirahsoft_muslim/features/adhan/data/reciter_catalog.dart';
import 'package:shirahsoft_muslim/features/adhan/services/adhan_settings.dart';

class AdhanSettingsDialog extends StatefulWidget {
  const AdhanSettingsDialog({super.key});

  @override
  State<AdhanSettingsDialog> createState() => _AdhanSettingsDialogState();
}

class _AdhanSettingsDialogState extends State<AdhanSettingsDialog> {
  late final AdhanSettings _settings;
  late PrayerNotificationAudioMode _mode;
  late String _reciterId;

  @override
  void initState() {
    super.initState();
    _settings = AdhanSettings(sl<SharedPreferences>());
    _mode = _settings.mode;
    _reciterId = _settings.reciter.id;
  }

  Future<void> _save() async {
    await _settings.setMode(_mode);
    await _settings.setReciter(AdhanReciterCatalog.byId(_reciterId));
    await sl<ScheduleNotificationsUseCase>()(force: true);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(
        l10n.settings_prayer_sounds,
        style: const TextStyle(fontFamily: 'Cairo'),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                l10n.settings_alert_method,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...PrayerNotificationAudioMode.values.map(
              (mode) => RadioListTile<PrayerNotificationAudioMode>(
                value: mode,
                groupValue: _mode,
                onChanged: (value) => setState(() => _mode = value!),
                title: Text(
                  _audioModeName(l10n, mode),
                  style: const TextStyle(fontFamily: 'Cairo'),
                ),
              ),
            ),
            if (_mode == PrayerNotificationAudioMode.adhan) ...[
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _reciterId,
                decoration: InputDecoration(labelText: l10n.settings_muezzin),
                items: AdhanReciterCatalog.reciters
                    .map(
                      (reciter) => DropdownMenuItem(
                        value: reciter.id,
                        child: Text(
                          _reciterName(l10n, reciter.id),
                          style: const TextStyle(fontFamily: 'Cairo'),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _reciterId = value!),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.settings_cancel),
        ),
        FilledButton(onPressed: _save, child: Text(l10n.settings_save)),
      ],
    );
  }

  String _audioModeName(
    AppLocalizations l10n,
    PrayerNotificationAudioMode mode,
  ) {
    return switch (mode) {
      PrayerNotificationAudioMode.adhan => l10n.settings_audio_mode_adhan,
      PrayerNotificationAudioMode.notification =>
        l10n.settings_audio_mode_notification,
      PrayerNotificationAudioMode.silentVibration =>
        l10n.settings_audio_mode_silent_vibration,
    };
  }

  String _reciterName(AppLocalizations l10n, String reciterId) {
    return switch (reciterId) {
      'abdulbaset' => l10n.settings_adhan_reciter_abdulbaset,
      'alimulla' => l10n.settings_adhan_reciter_alimulla,
      'alqatami' => l10n.settings_adhan_reciter_alqatami,
      'aserehy' => l10n.settings_adhan_reciter_aserehy,
      'joshar' => l10n.settings_adhan_reciter_joshar,
      'kefah' => l10n.settings_adhan_reciter_kefah,
      'riad' => l10n.settings_adhan_reciter_riad,
      _ => reciterId,
    };
  }
}
