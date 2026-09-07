import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shirahsoft_muslim/core/database/isar_db.dart';
import 'package:shirahsoft_muslim/core/utils/network/network_info.dart';
import 'package:shirahsoft_muslim/core/utils/notifications/notification_inbox_service.dart';
import 'package:shirahsoft_muslim/features/quran/data/datasources/juzz_local.dart';
import 'package:shirahsoft_muslim/features/quran/data/datasources/surah_name_by_page_number_data.dart';
import 'package:shirahsoft_muslim/features/quran/data/datasources/surahs_meta_local.dart';
import 'package:shirahsoft_muslim/features/quran/data/datasources/voice_ayah_by_ayah_remote.dart';
import 'package:shirahsoft_muslim/features/quran/data/repositories/juzz_repository_impl.dart';
import 'package:shirahsoft_muslim/features/quran/data/repositories/surah_meta_impl.dart';
import 'package:shirahsoft_muslim/features/quran/data/repositories/surah_name_by_page_number_impl.dart';
import 'package:shirahsoft_muslim/features/quran/data/repositories/voice_ayah_by_ayah_impl.dart';
import 'package:shirahsoft_muslim/features/quran/domain/repositories/juzz_repository.dart';
import 'package:shirahsoft_muslim/features/quran/domain/repositories/surahs_meta_repository.dart';
import 'package:shirahsoft_muslim/features/quran/domain/usecases/get_juzz.dart';
import 'package:shirahsoft_muslim/features/quran/domain/usecases/get_surah_number_by_page_number.dart';
import 'package:shirahsoft_muslim/features/quran/domain/usecases/get_surahs_meta.dart';
import 'package:shirahsoft_muslim/features/quran/domain/usecases/get_voice_ayah_by_ayah.dart';
import 'package:shirahsoft_muslim/features/quran_moratal/data/datasources/surah_qari_remote_sources.dart';
import 'package:shirahsoft_muslim/features/quran_moratal/data/datasources/surahs_moratal_meta_data.dart';
import 'package:shirahsoft_muslim/features/quran_moratal/data/repositories/surah_meta_moratal_impl.dart';
import 'package:shirahsoft_muslim/features/quran_moratal/data/repositories/surah_qari_voice_impl.dart';
import 'package:shirahsoft_muslim/features/quran_moratal/data/services/moratal_download_service.dart';
import 'package:shirahsoft_muslim/features/quran_moratal/domain/repositories/surah_meta_moratal_repo.dart';
import 'package:shirahsoft_muslim/features/quran_moratal/domain/usecases/get_surah_qari_voice.dart';
import 'package:shirahsoft_muslim/features/quran_moratal/domain/usecases/get_surahs_moratal_names.dart';
import 'package:shirahsoft_muslim/features/tafsser/data/datasource/tafsser_local_data_source.dart';
import 'package:shirahsoft_muslim/features/tafsser/data/datasource/tafsser_remote_data_source.dart';
import 'package:shirahsoft_muslim/features/tafsser/data/repositories/tafsser_repository_impl.dart';
import 'package:shirahsoft_muslim/features/tafsser/domain/repositories/tafsser_repository.dart';
import 'package:shirahsoft_muslim/features/tafsser/domain/usecases/download_tafsser_usecase.dart';
import 'package:shirahsoft_muslim/features/tafsser/domain/usecases/get_ayah_tafsser_usecase.dart';
import 'package:shirahsoft_muslim/features/tafsser/domain/usecases/get_tafsser_books_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();

  if (!sl.isRegistered<SharedPreferences>()) {
    sl.registerSingleton<SharedPreferences>(prefs);
  }
  if (!sl.isRegistered<NotificationInboxService>()) {
    sl.registerSingleton<NotificationInboxService>(
      NotificationInboxService(prefs),
    );
  }

  await IsarDb.initDatabase();

  if (!sl.isRegistered<Isar>()) {
    sl.registerSingleton<Isar>(IsarDb.database!);
  }
  if (!sl.isRegistered<Dio>()) {
    sl.registerLazySingleton(() => Dio());
  }
  if (!sl.isRegistered<NetworkInfo>()) {
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo());
  }

  _registerTafsir();
  _registerQuranReader();
  _registerMoratal();
}

void _registerTafsir() {
  if (!sl.isRegistered<GetAyahTafsserUseCase>()) {
    sl.registerLazySingleton(() => GetAyahTafsserUseCase(sl()));
  }
  if (!sl.isRegistered<GetTafsserBooksUseCase>()) {
    sl.registerLazySingleton(() => GetTafsserBooksUseCase(sl()));
  }
  if (!sl.isRegistered<DownloadTafsserUseCase>()) {
    sl.registerLazySingleton(() => DownloadTafsserUseCase(sl()));
  }
  if (!sl.isRegistered<TafsserRepository>()) {
    sl.registerLazySingleton<TafsserRepository>(
      () => TafsserRepositoryImpl(localDataSource: sl(), remoteDataSource: sl()),
    );
  }
  if (!sl.isRegistered<TafsserLocalDataSource>()) {
    sl.registerLazySingleton<TafsserLocalDataSource>(
      () => TafsserLocalDataSourceImpl(),
    );
  }
  if (!sl.isRegistered<TafsserRemoteDataSource>()) {
    sl.registerLazySingleton<TafsserRemoteDataSource>(
      () => TafsserRemoteDataSourceImpl(sl()),
    );
  }
}

void _registerQuranReader() {
  if (!sl.isRegistered<SurahsMetaLocalImpl>()) {
    sl.registerLazySingleton<SurahsMetaLocalImpl>(() => SurahsMetaLocalImpl());
  }
  if (!sl.isRegistered<SurahsDataRepository>()) {
    sl.registerLazySingleton<SurahsDataRepository>(
      () => SurahsMetaRepositoryImpl(sl()),
    );
  }
  if (!sl.isRegistered<GetSurahsMeta>()) {
    sl.registerLazySingleton<GetSurahsMeta>(() => GetSurahsMeta(sl()));
  }

  if (!sl.isRegistered<JuzzLocalImpl>()) {
    sl.registerLazySingleton<JuzzLocalImpl>(() => JuzzLocalImpl());
  }
  if (!sl.isRegistered<JuzzRepository>()) {
    sl.registerLazySingleton<JuzzRepository>(() => JuzzRepositoryImpl(sl()));
  }
  if (!sl.isRegistered<GetJuzz>()) {
    sl.registerLazySingleton<GetJuzz>(() => GetJuzz(sl()));
  }
  if (!sl.isRegistered<GetAllJuzz>()) {
    sl.registerLazySingleton<GetAllJuzz>(() => GetAllJuzz(sl()));
  }

  if (!sl.isRegistered<SurahNameByPageNumberDataImpl>()) {
    sl.registerLazySingleton<SurahNameByPageNumberDataImpl>(
      () => SurahNameByPageNumberDataImpl(),
    );
  }
  if (!sl.isRegistered<SurahNameByPageNumberImpl>()) {
    sl.registerLazySingleton<SurahNameByPageNumberImpl>(
      () => SurahNameByPageNumberImpl(sl()),
    );
  }
  if (!sl.isRegistered<GetSurahNumberByPageNumber>()) {
    sl.registerLazySingleton<GetSurahNumberByPageNumber>(
      () => GetSurahNumberByPageNumber(sl()),
    );
  }

  if (!sl.isRegistered<VoiceAyahByAyahImpl>()) {
    sl.registerLazySingleton<VoiceAyahByAyahImpl>(
      () => VoiceAyahByAyahImpl(sl()),
    );
  }
  if (!sl.isRegistered<VoiceAyahByAyahRemoteImpl>()) {
    sl.registerLazySingleton<VoiceAyahByAyahRemoteImpl>(
      () => VoiceAyahByAyahRemoteImpl(),
    );
  }
  if (!sl.isRegistered<GetVoiceAyahByAyah>()) {
    sl.registerLazySingleton<GetVoiceAyahByAyah>(
      () => GetVoiceAyahByAyah(sl()),
    );
  }
}

void _registerMoratal() {
  if (!sl.isRegistered<MoratalDownloadService>()) {
    sl.registerLazySingleton<MoratalDownloadService>(
      () => MoratalDownloadService(prefs: sl()),
    );
  }
  if (!sl.isRegistered<SurahQariRemoteSourcesImpl>()) {
    sl.registerLazySingleton<SurahQariRemoteSourcesImpl>(
      () => SurahQariRemoteSourcesImpl(),
    );
  }
  if (!sl.isRegistered<SurahQariVoiceImpl>()) {
    sl.registerLazySingleton<SurahQariVoiceImpl>(
      () => SurahQariVoiceImpl(sl()),
    );
  }
  if (!sl.isRegistered<GetSurahQariVoice>()) {
    sl.registerLazySingleton<GetSurahQariVoice>(() => GetSurahQariVoice(sl()));
  }
  if (!sl.isRegistered<SurahsMoratalMetaData>()) {
    sl.registerLazySingleton<SurahsMoratalMetaData>(
      () => SurahsMoratalMetaDataImpl(),
    );
  }
  if (!sl.isRegistered<SurahMetaMoratalRepo>()) {
    sl.registerLazySingleton<SurahMetaMoratalRepo>(
      () => SurahMetaMoratalImpl(sl()),
    );
  }
  if (!sl.isRegistered<GetSurahsMoratalNames>()) {
    sl.registerLazySingleton<GetSurahsMoratalNames>(
      () => GetSurahsMoratalNames(sl()),
    );
  }
}
