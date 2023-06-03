import 'package:get_it/get_it.dart';
import 'package:how_cagri_work_on_flutter/data/auth_api_client.dart';
import 'package:how_cagri_work_on_flutter/data/auth_repository.dart';
import 'package:how_cagri_work_on_flutter/data/database_api_client.dart';
import 'package:how_cagri_work_on_flutter/data/database_repository.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt
    ..registerLazySingleton<AuthRepository>(() => AuthRepository())
    ..registerLazySingleton<AuthApiClient>(() => AuthApiClient())
    ..registerLazySingleton<DatabaseRepository>(() => DatabaseRepository())
    ..registerLazySingleton<DatabaseApiClient>(() => DatabaseApiClient());
}
