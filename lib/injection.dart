import 'package:get_it/get_it.dart';
import 'package:kost_z/data/datasources/auth_remote_datasource.dart';
import 'package:kost_z/domain/usecases/sign_in_user.dart';
import 'package:kost_z/domain/usecases/sign_up_user.dart';
import 'package:kost_z/providers/auth_notifier.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  //Provider
  getIt.registerFactory(
    () => AuthNotifer(
      signInUser: getIt(),
      signUpUser: getIt(),
    ),
  );

  //Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemotDataSource: getIt(),
    ),
  );

  //DataSource
  getIt.registerLazySingleton<AuthRemotDataSource>(
    () => AuthRemotDataSourceImpl(),
  );

  //usecases
  getIt.registerLazySingleton(() => SignInUser(getIt()));
  getIt.registerLazySingleton(() => SignUpUser(getIt()));

  /// External
  getIt.registerLazySingleton(() => http.Client());
}
