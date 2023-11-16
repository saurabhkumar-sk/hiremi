import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollageListProvider with ChangeNotifier {
  String _collageName = "";
  String _selectCollage = 'Select Collage';

  String get collageName => _collageName;
  String get selectCollage => _selectCollage;

  set collageName(String value) {
    _collageName = value;
    notifyListeners();
  }

  set selectCollage(String value) {
    _selectCollage = value;
    notifyListeners();
  }
}
