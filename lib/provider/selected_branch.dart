import 'package:flutter/material.dart';

class SelectedBranch extends ChangeNotifier {
  String _selectedBranch = 'Civil Engineering';

  String get selectedBranch => _selectedBranch;

  set selectedBranch(String newState) {
    _selectedBranch = newState;
    notifyListeners();
  }
}
