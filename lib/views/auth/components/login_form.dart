part of 'login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginVM>.value(
        value: context.watch<LoginVM>(),
        builder: (context, _) {
          var state = context.watch<LoginVM>();

          if (state.formStatus == FormStatus.passed) {
            developer.log("Login passed");

            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.go(AppRoutes.dashboard);
            });
          }

          return GErrorListener<LoginVM>(
              child: Form(
                key: state.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.enterEmail,
                        style: Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: AppConstants.xSmallSpacing),
                    DTextFormField(
                        labelText: AppStrings.exampleEmail,
                        controller: state.usernameCtrl,
                        textInputType: TextInputType.emailAddress),
                    SizedBox(height: AppConstants.smallSpacing),
                    Text(AppStrings.enterPassword,
                        style: Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: AppConstants.xSmallSpacing),
                    DTextFormFieldWithSuffix(
                        labelText: AppStrings.examplePassword,
                        obscureText: state.obscureText,
                        controller: state.passwordCtrl,
                        textInputAction: TextInputAction.done,
                        suffix: IconButton(
                          icon: Icon(
                              state.obscureText
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              size: AppConstants.defaultIconSize),
                          onPressed: () => state.toggleVisibility(),
                        )),
                    SizedBox(height: AppConstants.smallSpacing),
                    Text(AppStrings.forgottenPassword,
                        style: Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: AppConstants.smallSpacing),
                    Offstage(
                      offstage: state.formStatus != FormStatus.loading,
                      child: DLoadingButton(),
                    ),
                    Offstage(
                      offstage: state.formStatus == FormStatus.loading,
                      child: DButton(
                        label: AppStrings.login,
                        onPressed: () => state.loginWithEmail(),
                      ),
                    )
                  ],
                ),
              ),
              onWillPop: () {
                state.resetState();
                context.pop();
              });
        });
  }
}
