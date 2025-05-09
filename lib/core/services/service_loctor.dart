import 'package:bookly_app/core/api/api_service.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<Dio>(
    Dio(),
  );
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: getIt.get<Dio>(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
}
