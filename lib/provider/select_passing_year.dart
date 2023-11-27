import 'package:flutter/material.dart';

class SelectPassingYear extends ChangeNotifier {
  String _selectPassingYear = '2024';

  String get selectPassingYear => _selectPassingYear;

  set selectPassingYear(String newState) {
    _selectPassingYear = newState;
    notifyListeners();
  }
}
