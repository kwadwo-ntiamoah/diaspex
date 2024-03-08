import 'package:diaspex/data/repos/category.repo.dart';
import 'package:diaspex/data/repos/misc.repo.dart';
import 'package:diaspex/data/repos/news.repo.dart';
import 'package:diaspex/data/repos/post.repo.dart';
import 'package:diaspex/data/repos/reply.repo.dart';
import 'package:diaspex/services/network/network.dart';
import 'package:diaspex/data/repos/auth.repo.dart';
import 'package:diaspex/services/storage.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  getIt.registerSingleton<FlutterSecureStorage>(
    const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    ),
  );

  getIt.registerSingleton<GoogleSignIn>(GoogleSignIn(
    scopes: ['email']
  ));

  // getIt.registerSingleton<Class>(Class());
  getIt
    ..registerSingleton<IStorage>(Storage(secureStorage: getIt()))
    ..registerSingleton<IHttpClient>(DioClient(dio: getIt()));

  // repos
  getIt
    ..registerSingleton<IAuthRepo>(AuthRepo(client: getIt()))
    ..registerSingleton<INewsRepo>(NewsRepo(client: getIt()))
    ..registerSingleton<ICategoryRepo>(CategoryRepo(client: getIt()))
    ..registerSingleton<IPostRepo>(PostRepo(client: getIt()))
    ..registerSingleton<IReplyRepo>(ReplyRepo(client: getIt()))
    ..registerSingleton<IMiscRepo>(MiscRepo(client: getIt()));
}
