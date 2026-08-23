import 'package:dartz/dartz.dart';
import 'package:shirahsoft_muslim/core/errors/failures.dart';
import 'package:shirahsoft_muslim/features/quran/domain/entities/surah_meta_entity.dart';

abstract class SurahsDataRepository {
  Either<Failure, List<SurahMetaEntity>> getSurahsName();
}
