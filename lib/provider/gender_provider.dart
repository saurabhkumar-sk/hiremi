import 'package:flutter/foundation.dart';

class GenderProvider extends ChangeNotifier {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  void toggleGenderSelectionmale() {
    isMaleSelected = !isMaleSelected;
    notifyListeners();
  }

  void toggleGenderSelectionfemail() {
    isFemaleSelected = !isFemaleSelected;
    notifyListeners();
  }
}
