part of '../settings.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const SettingsCard({super.key, required this.title, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: AppColors.textGray.withOpacity(.4)))
      ),
      child: ListTile(
        enableFeedback: true,
        onTap: onPressed,
        title: Text(title, style: Theme.of(context).textTheme.bodySmall),
        leading: Container(
          padding: EdgeInsets.all(AppConstants.xSmallSpacing),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.textGray.withOpacity(.4)),
            borderRadius: BorderRadius.circular(100)
          ),
          child: Icon(icon, size: AppConstants.defaultIconSize),
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
