import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kost_z/common/failure.dart';
import 'package:kost_z/data/datasources/auth_remote_datasource.dart';
import 'package:kost_z/domain/entities/user.dart';
import 'package:kost_z/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemotDataSource authRemotDataSource;

  AuthRepositoryImpl({required this.authRemotDataSource});

  @override
  Future<Either<Failure, Users>> signIn(String email, String password) async {
    try {
      final result = await authRemotDataSource.signInUser(email, password);

      return right(result.toEntity());
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException {
      return Left(ConncetionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, Users>> signUp(Users user, String password) async {
    try {
      final result = await authRemotDataSource.signUpUser(
        user.toModel(),
        password,
      );

      return Right(result.toEntity());
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException {
      return Left(ConncetionFailure("Failed to connect to the network"));
    }
  }
}
