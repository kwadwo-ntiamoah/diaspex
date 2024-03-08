import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/shared/g_error_listener.dart';
import 'package:diaspex/view_models/register_vm.dart';
import 'package:diaspex/views/register/components/register_wrapper.dart';
import 'package:diaspex/views/register/success.dart';
import 'package:diaspex/views/shared/app_button.dart';
import 'package:diaspex/views/shared/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CreateProfileView extends StatelessWidget {
  const CreateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterWrapper(
      pageName: AppStrings.wrappingUp,
      child: const _CreateProfileForm(),
    );
  }
}

class _CreateProfileForm extends StatelessWidget {
  const _CreateProfileForm();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterVM>.value(
      value: context.watch<RegisterVM>(),
      builder: (context, _) {
        var state = context.watch<RegisterVM>();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (state.formStatus == FormStatus.passed) {
            context.pop();
            state.resetState();

            showModalBottomSheet(
              backgroundColor: AppColors.bgLight,
              context: context,
              isScrollControlled: true,
              builder: (ctx) => const RegisterSuccessView(),
            );
          }
        });

        return GErrorListener<RegisterVM>(
          onWillPop: () => context.pop(),
          child: IntrinsicHeight(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.almostThere,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18)),
                  const SizedBox(height: 5),
                  Text("Let's get you started with a personalized profile",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.textGray,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: AppConstants.largeSpacing),

                  // country
                  Text(AppStrings.country,
                      style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: AppConstants.xSmallSpacing),
                  DTextFormField(
                    labelText: "Ghana",
                    controller: state.countryController,
                    textInputAction: TextInputAction.next,
                  ),

                  // phone
                  SizedBox(height: AppConstants.smallSpacing),
                  Text(AppStrings.enterPhone,
                      style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: AppConstants.xSmallSpacing),
                  DTextFormField(
                    labelText: "233540601234",
                    controller: state.phoneNumberController,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: false),
                    textInputAction: TextInputAction.next,
                  ),

                  // date of birth
                  // phone
                  SizedBox(height: AppConstants.smallSpacing),
                  Text(AppStrings.dob,
                      style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: AppConstants.xSmallSpacing),
                  DTextFormField(
                    labelText: "01-01-1990",
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1940, 1),
                          lastDate: DateTime.now());

                      if (picked != null) {
                        state.setDate(picked);
                      }
                    },
                    readonly: true,
                    controller: state.dateOfBirthController,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: false),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: AppConstants.xLargeSpacing),
                  Offstage(
                    offstage: state.formStatus != FormStatus.loading,
                    child: DLoadingButton(),
                  ),
                  Offstage(
                    offstage: state.formStatus == FormStatus.loading,
                    child: DButton(
                      label: AppStrings.lblContinue,
                      onPressed: () {
                        state.registerLocal();
                      },
                    )
                  ),
                  SizedBox(height: AppConstants.xxLargeSpacing)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
