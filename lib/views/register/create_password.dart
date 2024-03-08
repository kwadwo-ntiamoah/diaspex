import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/view_models/register_vm.dart';
import 'package:diaspex/views/register/components/register_wrapper.dart';
import 'package:diaspex/views/register/create_profile.dart';
import 'package:diaspex/views/shared/app_button.dart';
import 'package:diaspex/views/shared/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterWrapper(
      pageName: AppStrings.password,
      child: const _CreatePasswordForm(),
    );
  }
}

class _CreatePasswordForm extends StatelessWidget {
  const _CreatePasswordForm();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterVM>.value(
      value: context.watch<RegisterVM>(),
      builder: (context, _) {
        var state = context.watch<RegisterVM>();

        return IntrinsicHeight(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.password,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18)),
                const SizedBox(height: 5),
                Text("Let's get you started with a strong password",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.textGray,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: AppConstants.largeSpacing),

                // password
                Text(AppStrings.enterPassword,
                    style: Theme.of(context).textTheme.bodySmall),
                SizedBox(height: AppConstants.xSmallSpacing),
                DTextFormFieldWithSuffix(
                  labelText: AppStrings.examplePassword,
                  obscureText: state.obscurePassword,
                  controller: state.passwordController,
                  suffix: IconButton(
                    icon: Icon(
                        state.obscurePassword
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        size: AppConstants.defaultIconSize),
                    onPressed: () => state.togglePasswordVisibility(),
                  ),
                ),

                // confirm password
                SizedBox(height: AppConstants.smallSpacing),
                Text(AppStrings.confirmPassword,
                    style: Theme.of(context).textTheme.bodySmall),
                SizedBox(height: AppConstants.xSmallSpacing),
                DTextFormFieldWithSuffix(
                  labelText: AppStrings.examplePassword,
                  obscureText: state.obscureConfirmPassword,
                  controller: state.confirmPasswordController,
                  suffix: IconButton(
                    icon: Icon(
                        state.obscureConfirmPassword
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        size: AppConstants.defaultIconSize),
                    onPressed: () => state.toggleConfirmPasswordVisibility(),
                  ),
                ),
                SizedBox(height: AppConstants.xLargeSpacing),
                DButton(
                  label: AppStrings.lblContinue,
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      context.pop();
                      
                      showModalBottomSheet(
                          backgroundColor: AppColors.bgLight,
                          context: context,
                          isScrollControlled: true,
                          builder: (ctx) => const CreateProfileView(),
                        );
                    });
                  },
                ),
                SizedBox(height: AppConstants.xxLargeSpacing)
              ],
            ),
          ),
        );
      },
    );
  }
}
