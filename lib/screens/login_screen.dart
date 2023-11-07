import 'package:flutter/material.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/models/api_user.dart';
import 'package:flutter_layout/screens/dashboard_screen.dart';
import 'package:flutter_layout/screens/forget_password_screen.dart';
import 'package:flutter_layout/screens/register_screen.dart';
import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // pushToScreen(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (_) => const DashbordScreen()),
  //   );
  // }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserService _userService = UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 101, right: 97, top: 122),
                    child: Image.asset(MyImages.hirmilogo),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 50, top: 270,
                      //  right: 117          crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    child: Text(
                      'Let\'s gets started.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 72),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 63),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'plese enter email';
                    }
                    return null; // Return null if the input is valid
                  },
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
                    hintText: 'email',
                    hintStyle: TextStyle(
                      color: MyColor.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Padding(
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
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 63),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    return null; // Return null if the input is valid
                  },
                  textInputAction: TextInputAction.done,
                  controller: passwordController,
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
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: MyColor.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Icon(
                        Icons.person_2_sharp,
                        size: 26,
                        color: MyColor.grey,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Icon(
                        Icons.remove_red_eye,
                        size: 26,
                        color: MyColor.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 44),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgetPasswordScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Forgot your password ?',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: MyColor.forgotcolor,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: SizedBox(
                  height: 55.0,
                  width: 230,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _userService.getapi();

                        var uid = _userService.uniqueId(
                            emailController.text.trim(),
                            passwordController.text.trim());
                        // pushToScreen(context);
                        bool loginSuccess = _userService.loginUser(
                            emailController.text.trim(),
                            passwordController.text.trim());

                        if (loginSuccess) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => DashbordScreen(
                                      uid: uid,
                                    )),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                    'Please enter correct information'),
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
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have on account ? ',
                    style: TextStyle(
                      color: MyColor.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const RegisterScreen(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
