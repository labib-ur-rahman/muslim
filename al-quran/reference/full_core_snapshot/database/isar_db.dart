import 'package:path_provider/path_provider.dart';
import 'package:isar_community/isar.dart';
import 'package:shirahsoft_muslim/core/utils/log/app_logger.dart';
import 'package:shirahsoft_muslim/features/quran/data/models/mark.dart';
import 'package:shirahsoft_muslim/features/quran/data/models/quran_models.dart';
import 'package:shirahsoft_muslim/features/tafsser/data/models/ayah.dart';
import 'package:shirahsoft_muslim/features/tafsser/data/models/tafsser_surah.dart';

/// Standalone Quran-module Isar database.
///
/// When merging into a larger app, add these schemas to that app's existing
/// Isar.open call instead of opening a second Isar instance:
/// QuranPageSchema, MarkSchema, TafsserSurahSchema, AyahTafsserSchema.
class IsarDb {
  static Isar? database;

  static Future<Isar> initDatabase() async {
    if (database != null && database!.isOpen) return database!;

    final dir = await getApplicationDocumentsDirectory();

    database = await Isar.open([
      QuranPageSchema,
      MarkSchema,
      TafsserSurahSchema,
      AyahTafsserSchema,
    ], directory: dir.path);

    AppLogger.logger.i("Quran module database initialized");
    return database!;
  }
}
