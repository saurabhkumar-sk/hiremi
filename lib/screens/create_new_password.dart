import 'package:flutter/material.dart';
import 'package:flutter_layout/api_services/api_urls/api_urls.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/screens/dashboard_screen.dart';
import 'package:flutter_layout/screens/login_screen.dart';

import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final pass1Controller = TextEditingController();
  final pass2Controller = TextEditingController();
  final UserService _userService = UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 39, left: 27, right: 300),
              child: SizedBox(
                height: 38,
                width: 32,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ClipOval(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          transform: GradientRotation(20),
                          colors: [
                            Color(0xFFF13640),
                            Color(0xFFBD2930),
                          ],
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Image.asset(MyImages.forgetPasswordImage),
            const Text(
              'Create New Password',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 18),
            ConstrainedBox(
              constraints: BoxConstraints.tight(
                const Size(337, 48),
              ),
              child: const Text(
                textAlign: TextAlign.center,
                'Your New Password Must Be Different from previously used password',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: pass1Controller,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColor.borderColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColor.borderColor,
                    ),
                  ),
                  hintText: 'New Password',
                  hintStyle: TextStyle(
                    color: MyColor.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Icon(
                      Icons.lock,
                      size: 25,
                      color: MyColor.grey,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Icon(
                      Icons.remove_red_eye,
                      size: 20,
                      color: MyColor.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: pass2Controller,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColor.borderColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColor.borderColor,
                    ),
                  ),
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(
                    color: MyColor.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Icon(
                      Icons.lock,
                      size: 25,
                      color: MyColor.grey,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Icon(
                      Icons.remove_red_eye,
                      size: 20,
                      color: MyColor.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 42),
            SizedBox(
              height: 55.0,
              width: 236,
              child: ElevatedButton(
                onPressed: () async {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => DashbordScreen(),
                  //   ),
                  // );
                  Map<String, dynamic> body = {
                    "pass1": pass1Controller.text.toString(),
                    "pass2": pass2Controller.text.toString()
                  };

                  var response = await _userService.createPostApi(
                      body, ApiUrls.passwordReset);
                  if (response.statusCode == 200) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  } else {
                    String errorMessage = response.body;
                    // ignore: use_build_context_synchronously
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          alignment: Alignment.center,
                          title: const Text('error'),
                          content: Text(errorMessage),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF13640),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
