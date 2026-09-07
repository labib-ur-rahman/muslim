import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shirahsoft_muslim/core/di/injection_container.dart';
import 'package:shirahsoft_muslim/core/errors/failures.dart';
import 'package:shirahsoft_muslim/features/quran/data/models/juzz_model.dart';
import 'package:shirahsoft_muslim/features/quran/domain/usecases/get_juzz.dart';

final allJuzzProvider = Provider<Either<Failure, List<JuzzModel>>>((ref) {
  return sl<GetAllJuzz>().call();
});
