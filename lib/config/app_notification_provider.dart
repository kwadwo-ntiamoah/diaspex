import 'package:diaspex/config/service_locator.dart';
import 'package:diaspex/view_models/app_init_vm.dart';
import 'package:diaspex/view_models/nav_vm.dart';
import 'package:diaspex/view_models/login_vm.dart';
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
        ChangeNotifierProvider<LoginVM>(create: (ctx) => LoginVM(authUseCase: getIt())),
        ChangeNotifierProvider<AppNavigationVM>(create: (ctx) => AppNavigationVM()),
      ],
      child: child,
    );
  }
}
