// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:diaspex/config/app_notification_provider.dart';
import 'package:diaspex/config/router.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:diaspex/config/service_locator.dart';
import 'package:diaspex/services/network/network.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: AppColors.primary, // navigation bar color
    statusBarColor: AppColors.primary, // status bar color
  ));

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppNotificationProvider(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.defaultTheme,
        routerConfig: router,
        builder: (BuildContext context, Widget? child) {
          final MediaQueryData data = MediaQuery.of(context);
          var isPassive = data.textScaleFactor > 1.5;

          return MediaQuery(
            data: data.copyWith(
                textScaleFactor: data.textScaleFactor * (isPassive ? 2 : 1)),
            child: child!,
          );
        },
      ),
    );
  }
}
