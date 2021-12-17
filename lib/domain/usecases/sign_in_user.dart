import 'package:dartz/dartz.dart';
import 'package:kost_z/common/failure.dart';
import 'package:kost_z/domain/entities/user.dart';
import 'package:kost_z/domain/repositories/auth_repository.dart';

class SignInUser {
  AuthRepository repository;

  SignInUser(this.repository);

  Future<Either<Failure, Users>> execute(String email, String password) {
    return repository.signIn(email, password);
  }
}
