import 'package:diaspex/data/repos/category.repo.dart';
import 'package:diaspex/data/repos/news.repo.dart';
import 'package:diaspex/data/repos/post.repo.dart';
import 'package:diaspex/services/network/network.dart';
import 'package:diaspex/data/repos/auth.repo.dart';
import 'package:diaspex/services/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<FlutterSecureStorage>(
    const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    ),
  );

  // getIt.registerSingleton<Class>(Class());
  getIt
    ..registerSingleton<IStorage>(Storage(secureStorage: getIt()))
    ..registerSingleton<IHttpClient>(DioClient(dio: getIt()));

  // repos
  getIt
      ..registerSingleton<IAuthRepo>(AuthRepo(client: getIt()))
      ..registerSingleton<INewsRepo>(NewsRepo(client: getIt()))
      ..registerSingleton<ICategoryRepo>(CategoryRepo(client: getIt()))
      ..registerSingleton<IPostRepo>(PostRepo(client: getIt()));
}
