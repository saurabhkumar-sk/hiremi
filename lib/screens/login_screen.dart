import 'package:flutter/material.dart';
import 'package:flutter_layout/api_services/geting_ragistration_data.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/provider/register_provider.dart';
import 'package:flutter_layout/screens/dashboard_screen.dart';
import 'package:flutter_layout/screens/forget_password_screen.dart';
import 'package:flutter_layout/screens/register_screen.dart';
import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String errorTextVal = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GettingRagistrationData _gettingRagistrationData =
      GettingRagistrationData();
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);

    // shared preferences
    void saveUserData(String email, String password) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLogged', true);
      prefs.setString('email', email);
      prefs.setString('password', password);
      print(prefs.getString('email'));
      print(prefs.getBool('isLogged'));
    }

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
                  controller: registerProvider.loginEmailController.controller,
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
                      return 'plese enter email';
                    }
                    return null; // Return null if the input is valid
                  },
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
                  obscureText:
                      true, // Set to true to obscure the text for password input
                  obscuringCharacter: '*',
                  textInputAction: TextInputAction.done,
                  controller:
                      registerProvider.loginPasswordController.controller,
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
                        await _gettingRagistrationData.getapi();

                        // pushToScreen(context);
                        bool loginSuccess = _gettingRagistrationData.loginUser(
                            registerProvider
                                .loginEmailController.controller.text
                                .trim(),
                            registerProvider
                                .loginPasswordController.controller.text
                                .trim());

                        if (loginSuccess) {
                          saveUserData(
                              registerProvider
                                  .loginEmailController.controller.text
                                  .trim(),
                              registerProvider
                                  .passwordController.controller.text
                                  .trim());
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => DashbordScreen()),
                          );
                        } else {
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                    'Please enter Correct email or Password'),
                                content: const Text(
                                    'Try forget password and try again'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: const Text('OK'),
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
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
