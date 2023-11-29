part of '../auth.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.imagesLogo),
          SizedBox(height: AppConstants.defaultSpacing),
          Text(
            AppStrings.loginOrSignUp,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.white),
          ),
          SizedBox(height: AppConstants.smallSpacing),
          Text(
            AppStrings.getQuickAccess,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.white),
          ),
          SizedBox(height: AppConstants.defaultSpacing),
          DSocialButton(
              icon: Assets.iconsFacebook,
              label: AppStrings.continueWithFacebook,
              onPressed: () {}),
          SizedBox(height: AppConstants.smallSpacing),
          DSocialButton(
              icon: Assets.iconsGoogle,
              label: AppStrings.continueWithGoogle,
              onPressed: () {}),
          SizedBox(height: AppConstants.smallSpacing),
          DSocialButton(
              icon: Assets.iconsEmail,
              label: AppStrings.signUpWithEmail,
              onPressed: () {}),
          SizedBox(height: AppConstants.smallSpacing),
          DButton(
              label: AppStrings.login,
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: AppColors.bgLight,
                  context: context,
                  isScrollControlled: true,
                  builder: (ctx) => const LoginView(),
                );
              })
        ],
      ),
    );
  }
}
