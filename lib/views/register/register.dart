import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/shared/g_error_listener.dart';
import 'package:diaspex/view_models/register_vm.dart';
import 'package:diaspex/views/register/components/register_wrapper.dart';
import 'package:diaspex/views/register/confirm_email.dart';
import 'package:diaspex/views/shared/app_button.dart';
import 'package:diaspex/views/shared/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterWrapper(
      pageName: AppStrings.register,
      child: const _RegisterForm(),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterVM>(builder: (context, state, _) {

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (state.sendVerifyCodeStatus == FormStatus.passed) {
          context.pop();

          showModalBottomSheet(
            backgroundColor: AppColors.bgLight,
            context: context,
            isScrollControlled: true,
            builder: (ctx) => const RegisterConfirmEmail(),
          );
        }
      });

      return GErrorListener<RegisterVM>(
        onWillPop: () => context.pop(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    text: "Sign Up to ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18),
                    children: [
                  TextSpan(
                      text: "b4u Go",
                      style: Theme.of(context).textTheme.bodyLarge)
                ])),
            SizedBox(height: AppConstants.smallSpacing),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.enterName,
                      style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: AppConstants.xSmallSpacing),
                  DTextFormField(
                      labelText: AppStrings.exampleName,
                      controller: state.nameController,
                      textInputType: TextInputType.emailAddress),
                  SizedBox(height: AppConstants.smallSpacing),
                  Text(AppStrings.enterEmail,
                      style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: AppConstants.xSmallSpacing),
                  DTextFormField(
                      labelText: AppStrings.exampleEmail,
                      controller: state.usernameController,
                      textInputType: TextInputType.emailAddress),
                  SizedBox(height: AppConstants.smallSpacing),
                  Text(
                    AppStrings.emailInstruction,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.textGray,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  SizedBox(height: AppConstants.smallSpacing),
                  Offstage(
                    offstage: state.sendVerifyCodeStatus != FormStatus.loading,
                    child: DLoadingButton(),
                  ),
                  Offstage(
                    offstage: state.sendVerifyCodeStatus == FormStatus.loading,
                    child: DButton(
                      label: AppStrings.lblContinue,
                      onPressed: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          // trigger email confirmation here
                          state.sendConfirmationCode();
                        });
                      },
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height: AppConstants.xxLargeSpacing)
          ],
        ),
      );
    });
  }
}
