import 'package:isar_community/isar.dart';

import 'package:shirahsoft_muslim/core/database/isar_db.dart';
import 'package:shirahsoft_muslim/features/tafsser/data/models/ayah.dart';
import 'package:shirahsoft_muslim/features/tafsser/data/models/tafsser_surah.dart';
import 'package:shirahsoft_muslim/features/tafsser/data/repositories/insert_tafsser.dart';

abstract class TafsserLocalDataSource {
  Future<AyahTafsser?> getAyahTafsser({
    required String tafsserId,
    required int surahNumber,
    required int ayahNumber,
  });

  Future<void> saveTafsserJson(dynamic jsonMap);

  Future<bool> isTafsserDownloaded(String identifier);

  Future<void> deleteTafsser(String identifier);
}

class TafsserLocalDataSourceImpl implements TafsserLocalDataSource {
  final Isar? isar = IsarDb.database;

  @override
  Future<AyahTafsser?> getAyahTafsser({
    required String tafsserId,
    required int surahNumber,
    required int ayahNumber,
  }) async {
    if (isar == null) return null;

    final surah = await isar!.tafsserSurahs
        .filter()
        .numberEqualTo(surahNumber)
        .and()
        .edition((e) => e.identifierEqualTo(tafsserId))
        .findFirst();

    if (surah == null) return null;

    if (!surah.ayahs.isLoaded) {
      await surah.ayahs.load();
    }

    try {
      return surah.ayahs.firstWhere((a) => a.numberInSurah == ayahNumber);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveTafsserJson(dynamic jsonMap) async {
    await insertTafsserToIsar(jsonMap: jsonMap);
  }

  @override
  Future<bool> isTafsserDownloaded(String identifier) async {
    if (isar == null) return false;
    final count = await isar!.tafsserSurahs
        .filter()
        .edition((q) => q.identifierEqualTo(identifier))
        .count();
    return count > 0;
  }

  @override
  Future<void> deleteTafsser(String identifier) async {
    if (isar == null) return;

    final surahs = await isar!.tafsserSurahs
        .filter()
        .edition((q) => q.identifierEqualTo(identifier))
        .findAll();

    final ayahIds = <Id>[];
    for (final surah in surahs) {
      if (!surah.ayahs.isLoaded) {
        await surah.ayahs.load();
      }
      ayahIds.addAll(surah.ayahs.map((ayah) => ayah.id));
    }

    await isar!.writeTxn(() async {
      if (ayahIds.isNotEmpty) {
        await isar!.ayahTafssers.deleteAll(ayahIds);
      }
      if (surahs.isNotEmpty) {
        await isar!.tafsserSurahs.deleteAll(surahs.map((s) => s.id).toList());
      }
    });
  }
}
