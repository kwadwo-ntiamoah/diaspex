import 'package:flutter/cupertino.dart';

class AppNavigationVM extends ChangeNotifier {
  int _currentBottomNavIndex = 0;
  String _currentPostCategory = "All";
  String _currentQuestionCategory = "All";

  int get currentBottomNavIndex => _currentBottomNavIndex;
  String get currentPostCategory => _currentPostCategory;
  String get currentQuestionCategory => _currentQuestionCategory;

  void setCurrentBottomNavIndex(int newIndex) {
    _currentBottomNavIndex = newIndex;
    notifyListeners();
  }

  void setCurrentPostCategory(String newCategory) {
    _currentPostCategory = newCategory;
    notifyListeners();
  }

  void setCurrentQuestionCategory(String newCategory) {
    _currentQuestionCategory = newCategory;
    notifyListeners();
  }
}