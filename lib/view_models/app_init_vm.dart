import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class AppInitVM extends ChangeNotifier {
  bool _isResolved = false;

  bool get isResolved => _isResolved;

  Future init() async {
    await Future.delayed(const Duration(seconds: 5), () => {
      developer.log("This run")
    });
    _isResolved = true;

    notifyListeners();
  }
}