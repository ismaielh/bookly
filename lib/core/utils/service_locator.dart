import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://www.googleapis.com/books/v1/",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );
  getIt.registerSingleton<ApiService>(ApiService(dio));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  // تسجيل HomeRepo كـ interface لتسهيل الوصول إليه
  getIt.registerLazySingleton<HomeRepo>(() => getIt.get<HomeRepoImpl>());
}
