part of '../questions_posts.dart';

class QuestPostTab extends StatelessWidget {
  const QuestPostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColors.borderLight))),
            child: SizedBox(
              height: AppConstants.largeSpacing,
              child: TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                indicatorColor: AppColors.btnPrimary,
                labelStyle: Theme.of(context).textTheme.bodySmall,
                tabs: [
                  Tab(
                    text: AppStrings.questions,
                  ),
                  Tab(text: AppStrings.posts),
                ],
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * .2,
                maxHeight: MediaQuery.of(context).size.height * .5),
            child: const TabBarView(
              children: [
                QuestionList(),
                PostList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
