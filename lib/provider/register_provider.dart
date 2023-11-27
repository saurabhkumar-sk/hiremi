import 'package:flutter/foundation.dart';
import 'package:flutter_layout/provider/textediting_controller.dart';

class RegisterProvider extends ChangeNotifier {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  bool isotherSelected = false;
  void toggleGenderSelectionmale() {
    isMaleSelected = !isMaleSelected;
    notifyListeners();
  }

  void toggleGenderSelectionfemail() {
    isFemaleSelected = !isFemaleSelected;
    notifyListeners();
  }

  void toggleGenderSelectionOther() {
    isotherSelected = !isotherSelected;
    notifyListeners();
  }

  // isVerified is use to check if the user is verified or not

  bool? _isVerified;

  bool? get isVerified => _isVerified;

  set isVerified(bool? value) {
    _isVerified = value;
    notifyListeners();
  }

  MyTextEditingController _firstnameController = MyTextEditingController();
  MyTextEditingController _lastnameController = MyTextEditingController();
  MyTextEditingController _fatherFirstController = MyTextEditingController();
  MyTextEditingController _fatherLastController = MyTextEditingController();
  MyTextEditingController _genderController = MyTextEditingController();
  MyTextEditingController _emailController = MyTextEditingController();
  MyTextEditingController _dateOfBirthController = MyTextEditingController();
  MyTextEditingController _addressController = MyTextEditingController();
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

// for login controller
  MyTextEditingController _loginEmailController = MyTextEditingController();
  MyTextEditingController _loginPasswordController = MyTextEditingController();

  MyTextEditingController get loginEmailController => _loginEmailController;
  MyTextEditingController get loginPasswordController =>
      _loginPasswordController;

  MyTextEditingController get firstnameController => _firstnameController;
  MyTextEditingController get lastnameController => _lastnameController;
  MyTextEditingController get fatherFirstController => _fatherFirstController;
  MyTextEditingController get fatherLastController => _fatherLastController;
  MyTextEditingController get genderController => _genderController;
  MyTextEditingController get emailController => _emailController;

  MyTextEditingController get dateOfBirthController => _dateOfBirthController;
  MyTextEditingController get addressController => _addressController;
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
    _loginEmailController.controller.clear();
    _loginPasswordController.controller.clear();
    _firstnameController.controller.clear();
    _lastnameController.controller.clear();
    _fatherFirstController.controller.clear();
    _fatherLastController.controller.clear();
    _genderController.controller.clear();
    _emailController.controller.clear();
    _dateOfBirthController.controller.clear();
    _addressController.controller.clear();
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
