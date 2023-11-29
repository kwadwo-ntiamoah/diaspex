import 'package:diaspex/config/constants.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:diaspex/shared/GAlert/g_alert.dart';
import 'package:diaspex/view_models/errorNotifier.mixin.dart';
import 'package:diaspex/views/shared/app_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class GErrorListener<T extends ErrorNotifierMixin> extends StatelessWidget {
  final Widget child;
  final VoidCallback onWillPop;

  const GErrorListener({
    super.key,
    required this.child,
    required this.onWillPop,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, model, child) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (model.error != null) _handleError(context, model, onWillPop);
        });

        return child!;
      },
      child: child,
    );
  }

  void _handleError(BuildContext context, T model, VoidCallback onWillPop) {
    GAlertWithCustomIcon(
      context: context,
      title: AppStrings.warning,
      subtitle: model.error!,
      icon: Lottie.asset(Assets.animationsWarning, width: 100, height: 100),
      onWillPop: () {
        onWillPop();
        model.clearError();
      },
      button: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: DButton(
            onPressed: () {
              onWillPop();
              model.clearError();
            },
            label: AppStrings.ok),
      ),
    ).fire();

    model.clearError();
  }
}
