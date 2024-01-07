import 'package:flutter/cupertino.dart';

class AppNavigationVM extends ChangeNotifier {
  int _currentBottomNavIndex = 0;

  int get currentBottomNavIndex => _currentBottomNavIndex;

  void setCurrentBottomNavIndex(int newIndex) {
    _currentBottomNavIndex = newIndex;
    notifyListeners();
  }


}