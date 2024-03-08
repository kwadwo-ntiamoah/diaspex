import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/views/auth/components/login.dart';
import 'package:diaspex/views/register/components/register_wrapper.dart';
import 'package:diaspex/views/shared/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterSuccessView extends StatelessWidget {
  const RegisterSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterWrapper(
      pageName: AppStrings.completed,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline_outlined,
                  color: Colors.green,
                  size: 65,
                ),
                SizedBox(height: AppConstants.smallSpacing),
                Text("You have successfully created your account",
                    style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
            DButton(
                label: "${AppStrings.lblContinue} to Login",
                onPressed: () {
                  context.pop();

                  showModalBottomSheet(
                    backgroundColor: AppColors.bgLight,
                    context: context,
                    isScrollControlled: true,
                    builder: (ctx) => const LoginView(),
                  );
                })
          ],
        ),
      ),
    );
  }
}
