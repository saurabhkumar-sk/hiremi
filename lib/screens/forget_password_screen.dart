import 'package:flutter/material.dart';
import 'package:flutter_layout/api_services/api_urls/api_urls.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/provider/forget_password_controller.dart';
import 'package:flutter_layout/screens/otp_verification_screen.dart';

import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool isProgressIndicator = false;
  String errorTextVal = '';
  UserService _userService = new UserService();
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> storeCSRFToken(String csrfToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('csrfToken', csrfToken);
  }

  @override
  Widget build(BuildContext context) {
    final forgetPasswordProvider = Provider.of<ForgetPasswordProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                'Forget Password',
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
                  'Please Enter Your Email Address To Reeived a Verification Code ',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 63),
                child: TextFormField(
                  controller: forgetPasswordProvider.emailController.controller,
                  onChanged: (value) {
                    setState(() {
                      if (value.contains(' ')) {
                        errorTextVal = "Don't use blank spaces";
                      } else if (!value.contains('@gmail.com')) {
                        errorTextVal = "use @gmail.com in the email";
                      } else {
                        errorTextVal = '';
                      }
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an email';
                    }
                    // Define a regular expression for email validation.
                    final emailRegex =
                        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    errorText: errorTextVal.isEmpty ? null : errorTextVal,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: MyColor.borderColor,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: MyColor.borderColor,
                      ),
                    ),
                    hintText: 'Email Address',
                    hintStyle: const TextStyle(
                      color: MyColor.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Icon(
                        Icons.person_2_sharp,
                        size: 26,
                        color: MyColor.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 75),
              const Text(
                'Try another way',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: MyColor.pink),
              ),
              const SizedBox(height: 42),
              SizedBox(
                height: 55.0,
                width: 230,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isProgressIndicator = true;
                        if (isProgressIndicator) {
                          CircularProgressIndicator(
                            color: Colors.black,
                          );
                        }
                      });
                      Map<String, dynamic> body = {
                        "email": forgetPasswordProvider
                            .emailController.controller.text
                            .toString()
                      };
                      final responce = await _userService.createPostApi(
                          body, ApiUrls.forgetPaassword);
                      if (responce.statusCode == 200) {
                        String csrfToken = responce.headers['set-cookie'] ?? '';
                        print("CSRF token is " + csrfToken);
                        isProgressIndicator = false;
                        await storeCSRFToken(csrfToken);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OtpVerificationScreen(),
                          ),
                        );
                      } else {
                        isProgressIndicator = false;
                        final error = responce.body;
                        // ignore: use_build_context_synchronously
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('error'),
                              content: Text(error.toString()),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF13640),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: isProgressIndicator
                      ? CircularProgressIndicator()
                      : const Text(
                          "Send",
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
      ),
    );
  }
}
