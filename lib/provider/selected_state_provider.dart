import 'package:flutter/material.dart';

class SelectState extends ChangeNotifier {
  String _selectedState = 'Madhya Pradesh';

  String get selectedState => _selectedState;

  set selectedState(String newState) {
    _selectedState = newState;
    notifyListeners();
  }
}
