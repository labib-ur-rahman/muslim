import 'package:dartz/dartz.dart';
import 'package:shirahsoft_muslim/core/errors/failures.dart';
import 'package:shirahsoft_muslim/features/quran/data/datasources/surahs_meta_local.dart';
import 'package:shirahsoft_muslim/features/quran/domain/entities/surah_meta_entity.dart';
import 'package:shirahsoft_muslim/features/quran/domain/repositories/surahs_meta_repository.dart';

class SurahsMetaRepositoryImpl implements SurahsDataRepository {
  SurahsMetaLocalImpl surahsNameLocal;
  SurahsMetaRepositoryImpl(this.surahsNameLocal);
  @override
  Either<Failure, List<SurahMetaEntity>> getSurahsName() {
    final List<SurahMetaEntity> surahsName = surahsNameLocal.surahsNames();

    if (surahsName.isNotEmpty) {
      return Right(surahsName);
    }

    return Left(DataFailure("لم يتم جلب اسماء السور"));
  }
}
