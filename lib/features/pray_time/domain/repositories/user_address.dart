import 'package:dartz/dartz.dart';
import 'package:shirahsoft_muslim/core/errors/failures.dart';
import 'package:shirahsoft_muslim/features/pray_time/domain/entities/user_address_entity.dart';

abstract class UserAddressRepository {
  Future<Either<Failure, UserAddressEntity>> getUserCityAndCountry(
    double lat,
    double long,
  );
}
