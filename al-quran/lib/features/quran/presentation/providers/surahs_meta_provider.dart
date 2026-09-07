import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shirahsoft_muslim/core/di/injection_container.dart';
import 'package:shirahsoft_muslim/core/errors/failures.dart';
import 'package:shirahsoft_muslim/features/quran/domain/entities/surah_meta_entity.dart';
import 'package:shirahsoft_muslim/features/quran/domain/usecases/get_surahs_meta.dart';

final surahsMetaProvider = Provider<Either<Failure, List<SurahMetaEntity>>>((
  ref,
) {
  return sl<GetSurahsMeta>().call();
});
