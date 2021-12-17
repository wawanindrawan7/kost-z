import 'package:dartz/dartz.dart';
import 'package:kost_z/common/failure.dart';
import 'package:kost_z/domain/entities/user.dart';
import 'package:kost_z/domain/repositories/auth_repository.dart';

class SignUpUser {
  final AuthRepository repository;

  SignUpUser(this.repository);

  Future<Either<Failure, Users>> execute(Users user, String password) {
    return repository.signUp(user, password);
  }
}
