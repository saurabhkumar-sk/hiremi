import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_layout/api_services/api_urls/api_urls.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/provider/forget_password_controller.dart';
import 'package:flutter_layout/screens/create_new_password.dart';

import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';
import 'package:provider/provider.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final UserService _userService = UserService();
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  final TextEditingController fieldFive = TextEditingController();
  final TextEditingController fieldSix = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final forgetPasswordProvider = Provider.of<ForgetPasswordProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 39, left: 27, right: 300),
              child: SizedBox(
                height: 50,
                width: 50,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ClipOval(
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      surfaceTintColor: Colors.transparent,
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
                          padding: EdgeInsets.only(right: 6),
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
            ),
            Image.asset(MyImages.forgetPasswordImage),
            const Text(
              'Verify Your Email',
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
                'Please Enter The 6 Digit Code Sent To your email address',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: fieldOne,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6), // Limit to 6 digits
                ],
                decoration: InputDecoration(
                  labelText: 'Enter otp',
                  hintText: 'please enter the 6 Digit Code ',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Resend Code',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: MyColor.pink),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 55.0,
              width: 236,
              child: ElevatedButton(
                onPressed: () async {
                  // String otp = fieldOne.text.toString().trim();
                  // print(otp);
                  // print(forgetPasswordProvider.emailController.controller.text
                  //     .toString());
                  // await _userService.getapi();
                  // var verifiedotp = _userService.otpValidation(
                  //     forgetPasswordProvider.emailController.controller.text
                  //         .toString());
                  // print(verifiedotp);
                  // if (otp.toString() == verifiedotp.toString()) {
                  //   print("otp verification successful");
                  //   // ignore: use_build_context_synchronously
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const CreateNewPasswordScreen(),
                  //     ),
                  //   );
                  // } else {
                  //   print("otp verification unsuccessful");
                  //   // ignore: use_build_context_synchronously
                  //   return showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         alignment: Alignment.center,
                  //         title: const Text('error'),
                  //         content: Text('please enter valid otp'),
                  //         actions: <Widget>[
                  //           TextButton(
                  //             onPressed: () {
                  //               Navigator.of(context).pop(); // Close the dialog
                  //             },
                  //             child: Text('OK'),
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   );
                  // }

                  // int otp = int.parse(
                  //   fieldOne.text.toString().trim() +
                  //       fieldTwo.text.toString().trim() +
                  //       fieldThree.text.toString().trim() +
                  //       fieldFour.text.toString().trim() +
                  //       fieldFive.text.toString().trim() +
                  //       fieldSix.text.toString().trim(),
                  // );
                  // print(otp);
                  String otp = fieldOne.text.toString().trim();
                  print(otp);
                  Map<String, dynamic> body = {
                    "otp": otp,
                  };

                  final responce = await _userService.createPostApi(
                      body, ApiUrls.otpValidation);
                  print(responce.statusCode);
                  print(responce.body);
                  if (responce.statusCode == 200) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateNewPasswordScreen(),
                      ),
                    );
                  } else {
                    var error = responce.body;
                    // ignore: use_build_context_synchronously
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('error'),
                          content: Text(error),
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
                  "Verify",
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
