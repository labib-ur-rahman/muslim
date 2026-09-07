import 'package:dartz/dartz.dart';
import 'package:shirahsoft_muslim/core/errors/failures.dart';
import 'package:shirahsoft_muslim/features/quran/data/models/juzz_model.dart';

abstract class JuzzRepository {
  Either<Failure, List<JuzzModel>> getAllJuzz();
  Either<Failure, JuzzModel> getJuzz(int id);
}
