import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/shared/g_error_listener.dart';
import 'package:diaspex/view_models/register_vm.dart';
import 'package:diaspex/views/register/components/register_wrapper.dart';
import 'package:diaspex/views/register/create_password.dart';
import 'package:diaspex/views/shared/app_button.dart';
import 'package:diaspex/views/shared/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterConfirmEmail extends StatelessWidget {
  const RegisterConfirmEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterWrapper(
      pageName: AppStrings.confirmEmail,
      child: const _ConfirmEmailForm(),
    );
  }
}

class _ConfirmEmailForm extends StatelessWidget {
  const _ConfirmEmailForm();

  @override
  Widget build(BuildContext context) {
    return GErrorListener<RegisterVM>(
      onWillPop: () => context.pop(),
      child: ChangeNotifierProvider<RegisterVM>.value(
        value: context.watch<RegisterVM>(),
        builder: (context, _) {
          var state = context.watch<RegisterVM>();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (state.verifyCodeStatus == FormStatus.passed) {
              context.pop();

              showModalBottomSheet(
                backgroundColor: AppColors.bgLight,
                context: context,
                isScrollControlled: true,
                builder: (ctx) => const CreatePasswordView(),
              );
            }
          });

          return IntrinsicHeight(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.confirmEmail,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18)),
                  const SizedBox(height: 5),
                  Text(
                      "Please enter the 6 digit code sent to ${state.usernameController.value.text}",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.textGray,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: AppConstants.largeSpacing),
                  Text(AppStrings.enterCode,
                      style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: AppConstants.xSmallSpacing),
                  DTextFormField(
                      labelText: AppStrings.examplePassword,
                      controller: state.otpCodeController,
                      textInputType: TextInputType.number),
                  SizedBox(height: AppConstants.defaultSpacing),
                  Row(
                    children: [
                      Text(
                        "Didn't receive code?",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 12),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          state.sendConfirmationCode();
                        },
                        child: Text(
                          "Resend Code",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: AppConstants.xxLargeSpacing + 10),
                  Offstage(
                    offstage: state.verifyCodeStatus != FormStatus.loading,
                    child: DLoadingButton(),
                  ),
                  Offstage(
                    offstage: state.verifyCodeStatus == FormStatus.loading,
                    child: DButton(
                      label: AppStrings.lblContinue,
                      onPressed: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          // verify code here
                          state.verifyConfirmationCode();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: AppConstants.xxLargeSpacing)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
