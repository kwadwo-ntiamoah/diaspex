import 'package:diaspex/config/service_locator.dart';
import 'package:diaspex/view_models/app_init_vm.dart';
import 'package:diaspex/view_models/category_vm.dart';
import 'package:diaspex/view_models/external_auth.vm.dart';
import 'package:diaspex/view_models/nav_vm.dart';
import 'package:diaspex/view_models/login_vm.dart';
import 'package:diaspex/view_models/news_vm.dart';
import 'package:diaspex/view_models/post_vm.dart';
import 'package:diaspex/view_models/register_vm.dart';
import 'package:diaspex/view_models/reply_vm.dart';
import 'package:diaspex/view_models/translate_vm.dart';
import 'package:diaspex/view_models/welcome_search_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppNotificationProvider extends StatelessWidget {
  final MaterialApp child;

  const AppNotificationProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppInitVM>(create: (ctx) => AppInitVM()),
        ChangeNotifierProvider<LoginVM>(
          create: (ctx) => LoginVM(
            authRepo: getIt(),
            storage: getIt(),
          ),
        ),
        ChangeNotifierProvider<AppNavigationVM>(
          create: (ctx) => AppNavigationVM(),
        ),
        ChangeNotifierProvider<WelcomeSearchVM>(
          create: (ctx) => WelcomeSearchVM(
            storage: getIt(),
          ),
        ),
        ChangeNotifierProvider<NewsVM>(
            create: (ctx) => NewsVM(newsRepo: getIt())),
        ChangeNotifierProvider<CategoryVM>(
            create: (ctx) => CategoryVM(categoryRepo: getIt())),
        ChangeNotifierProvider(create: (ctx) => PostVm(postRepo: getIt())),
        ChangeNotifierProvider(create: (ctx) => ReplyVm(replyRepo: getIt())),
        ChangeNotifierProvider(
            create: (ctx) => RegisterVM(authRepo: getIt(), storage: getIt())),
        ChangeNotifierProvider(create: (ctx) => TranslateVM(miscRepo: getIt())),
        ChangeNotifierProvider(
          create: (ctx) => ExternalAuthVM(
            googleSignIn: getIt(),
            firebaseAuth: getIt(),
            authRepo: getIt(),
            storage: getIt(),
          ),
        )
      ],
      child: child,
    );
  }
}
