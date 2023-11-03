import 'package:flutter/foundation.dart';
import 'package:flutter_layout/provider/textediting_controller.dart';

class RegisterProvider extends ChangeNotifier {
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

  MyTextEditingController _firstnameController = MyTextEditingController();
  MyTextEditingController _lastnameController = MyTextEditingController();
  MyTextEditingController _fatherFirstController = MyTextEditingController();
  MyTextEditingController _fatherLastController = MyTextEditingController();
  MyTextEditingController _genderController = MyTextEditingController();
  MyTextEditingController _emailController = MyTextEditingController();
  MyTextEditingController _dateOfBirthDayController = MyTextEditingController();
  MyTextEditingController _dateOfBirthMonthController =
      MyTextEditingController();
  MyTextEditingController _dateOfBirthYearController =
      MyTextEditingController();
  MyTextEditingController _birthStateController = MyTextEditingController();
  MyTextEditingController _birthcityController = MyTextEditingController();
  MyTextEditingController _phoneNumberController = MyTextEditingController();
  MyTextEditingController _whatsAppNumberController = MyTextEditingController();
  MyTextEditingController _collageStateController = MyTextEditingController();
  MyTextEditingController _collageNameController = MyTextEditingController();
  MyTextEditingController _branchNameController = MyTextEditingController();
  MyTextEditingController _passingYearController = MyTextEditingController();
  MyTextEditingController _passwordController = MyTextEditingController();
  MyTextEditingController _conformPasswordController =
      MyTextEditingController();

  MyTextEditingController get firstnameController => _firstnameController;
  MyTextEditingController get lastnameController => _lastnameController;
  MyTextEditingController get fatherFirstController => _fatherFirstController;
  MyTextEditingController get fatherLastController => _fatherLastController;
  MyTextEditingController get genderController => _genderController;
  MyTextEditingController get emailController => _emailController;
  MyTextEditingController get dateOfBirthDayController =>
      _dateOfBirthDayController;
  MyTextEditingController get dateOfBirthMonthController =>
      _dateOfBirthMonthController;
  MyTextEditingController get dateOfBirthYearController =>
      _dateOfBirthYearController;
  MyTextEditingController get birthStateController => _birthStateController;
  MyTextEditingController get birthcityController => _birthcityController;
  MyTextEditingController get phoneNumberController => _phoneNumberController;
  MyTextEditingController get whatsAppNumberController =>
      _whatsAppNumberController;
  MyTextEditingController get collageStateController => _collageStateController;
  MyTextEditingController get collageNameController => _collageNameController;
  MyTextEditingController get branchNameController => _branchNameController;
  MyTextEditingController get passingYearController => _passingYearController;
  MyTextEditingController get passwordController => _passwordController;
  MyTextEditingController get conformPasswordController =>
      _conformPasswordController;

  // Add more controllers as needed

  // Create a function to reset all controllers
  void resetControllers() {
    _firstnameController.controller.clear();
    _lastnameController.controller.clear();
    _fatherFirstController.controller.clear();
    _fatherLastController.controller.clear();
    _genderController.controller.clear();
    _emailController.controller.clear();
    _dateOfBirthDayController.controller.clear();
    _dateOfBirthMonthController.controller.clear();
    _dateOfBirthYearController.controller.clear();
    _birthStateController.controller.clear();
    _birthcityController.controller.clear();
    _phoneNumberController.controller.clear();
    _whatsAppNumberController.controller.clear();
    _collageStateController.controller.clear();
    _collageNameController.controller.clear();
    _branchNameController.controller.clear();
    _passingYearController.controller.clear();
    _passwordController.controller.clear();
    _conformPasswordController.controller.clear();

    // Reset other controllers as well
  }
}
