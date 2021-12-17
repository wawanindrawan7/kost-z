
import 'package:dartz/dartz.dart';
import 'package:kost_z/common/failure.dart';
import 'package:kost_z/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, Users>> signIn(String email, String password);
  Future<Either<Failure, Users>> signUp(Users user, String password);
}
