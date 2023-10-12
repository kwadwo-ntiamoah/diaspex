import 'dart:io';

import 'package:diaspex/config/app_notification_provider.dart';
import 'package:diaspex/config/router.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:diaspex/config/service_locator.dart';
import 'package:diaspex/config/network.dart';
import 'package:flutter/services.dart';

void main() {
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
