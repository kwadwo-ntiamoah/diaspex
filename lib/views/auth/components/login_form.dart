part of 'login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginVM>(builder: (ctx, state, _) {
      return Form(
        key: state.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.enterEmail,
                style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: AppConstants.xSmallSpacing),
            DTextFormField(
                labelText: AppStrings.exampleEmail,
                controller: state.usernameCtrl),
            SizedBox(height: AppConstants.smallSpacing),
            Text(AppStrings.enterPassword,
                style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: AppConstants.xSmallSpacing),
            DTextFormFieldWithSuffix(
                labelText: AppStrings.examplePassword,
                obscureText: state.obscureText,
                controller: state.passwordCtrl,
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
            DButton(
                label: AppStrings.login,
                onPressed: () {
                  state.loginWithEmail();
                  context.pushReplacementNamed(AppRoutes.home.routeName);
                })
          ],
        ),
      );
    });
  }
}
