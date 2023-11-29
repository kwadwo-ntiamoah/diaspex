part of '../index.dart';

class DiaspexBottomNavBar extends StatelessWidget {
  const DiaspexBottomNavBar({super.key});

  static List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: "Home",
      backgroundColor: AppColors.bgLight,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.search),
      label: "Search",
      backgroundColor: AppColors.bgLight,
    ),
    BottomNavigationBarItem(
      icon: Badge(
        label: const Text("5",
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: AppColors.bgDangerLight,
        child: const Icon(Icons.notifications_rounded),
      ),
      label: "Inbox",
      backgroundColor: AppColors.bgLight,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.settings),
      label: "Settings",
      backgroundColor: AppColors.bgLight,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNavigationVM>(builder: (ctx, state, _) {
      return Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(width: .5, color: AppColors.bgGraySecondary))),
        child: BottomNavigationBar(
          currentIndex: state.currentBottomNavIndex,
          onTap: (index) => state.setCurrentBottomNavIndex(index),
          items: navItems,
          selectedFontSize: AppConstants.smallIconSize,
          unselectedFontSize: AppConstants.smallIconSize,
          selectedItemColor: AppColors.btnPrimary,
          unselectedItemColor: AppColors.textGray,
          showUnselectedLabels: true,
          elevation: 1,
          backgroundColor: AppColors.bgLight,
        ),
      );
    });
  }
}
