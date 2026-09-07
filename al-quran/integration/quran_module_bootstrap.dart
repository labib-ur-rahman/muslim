import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:shirahsoft_muslim/core/di/injection_container.dart' as di;
import 'package:shirahsoft_muslim/core/notification_sound/notification_sound_manager.dart';
import 'package:shirahsoft_muslim/core/utils/notifications/notification_inbox_service.dart';
import 'package:shirahsoft_muslim/core/utils/notifications/notification_service.dart';
import 'package:shirahsoft_muslim/features/quran/data/repositories/insert_quran_pages.dart';
import 'package:shirahsoft_muslim/features/quran/domain/services/quran_search_indexer.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/providers/mark.dart';
import 'package:shirahsoft_muslim/features/tafsser/data/repositories/insert_tafsser.dart';

class QuranModuleBootstrap {
  static Future<void> initBeforeRunApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    tz.initializeTimeZones();
    await di.init();
    await insertQuranPagesToIsar();
    await loadTafsserFromAssest();
  }

  static Future<void> initAfterRunApp(ProviderContainer container) async {
    await JustAudioBackground.init(
      androidNotificationChannelId: 'quran_reader_audio',
      androidNotificationChannelName: 'Quran audio',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
      androidResumeOnClick: true,
    );

    await NotificationService.init();
    await di.sl<NotificationInboxService>().init();
    await NotificationSoundManager.ensureChannels(NotificationService.plugin);
    await container.read(marksProvder.notifier).loadMarks();

    unawaited(QuranSearchIndexer.initialize());
  }
}
