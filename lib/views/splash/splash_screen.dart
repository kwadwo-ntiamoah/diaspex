import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/view_models/app_init_vm.dart';
import 'package:diaspex/views/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    initApp();
    super.initState();
  }

  Future initApp() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var appInitVM = context.read<AppInitVM>();

      await appInitVM.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppInitVM>(builder: (ctx, state, _) {
      if (state.isResolved) {
        return const AuthView();
      } else {
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: Center(
            child: SvgPicture.asset(Assets.imagesLogo),
          ),
        );
      }
    });
  }
}
