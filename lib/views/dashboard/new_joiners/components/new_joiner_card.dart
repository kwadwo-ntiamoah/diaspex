part of '../new_joiners.dart';

class NewJoinerCard extends StatelessWidget {
  const NewJoinerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppConstants.xSmallMedium),
      child: Column(
        children: [
          SvgPicture.asset(Assets.iconsProfile),
          Flexible(child: Text("Emmanuella", style: Theme.of(context).textTheme.titleMedium))
        ],
      ),
    );
  }
}
