import 'package:flutter/foundation.dart';
import 'package:flutter_layout/provider/textediting_controller.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  MyTextEditingController _emailController = MyTextEditingController();
  MyTextEditingController _otpController = MyTextEditingController();

  MyTextEditingController get emailController => _emailController;
  MyTextEditingController get passwordController => _otpController;

  void resetControllers() {
    _emailController.controller.clear();
    _otpController.controller.clear();
  }
}
