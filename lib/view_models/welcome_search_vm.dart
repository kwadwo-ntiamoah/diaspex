import 'package:diaspex/services/storage.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;

class WelcomeSearchVM extends ChangeNotifier {
  final IStorage storage;

  WelcomeSearchVM({ required this.storage });

  String? _user;
  String? get user => _user;

  Future getUserDetails() async {
    var details = await storage.getUserDetails();

    if (details != null) {
      _user = details.split("@")[0];

      notifyListeners();
    }
  }
}