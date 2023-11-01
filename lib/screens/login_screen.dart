import 'package:flutter/material.dart';
import 'package:flutter_layout/screens/register_screen.dart';
import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    left: 76, top: 270,
                    //  right: 117
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
                controller: userNameController,
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
                  hintText: 'User Name',
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
            const Text(
              'Forgot your password ?',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: MyColor.forgotcolor,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              height: 55.0,
              width: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  transform: GradientRotation(180),
                  colors: [
                    Color(0xFFBD232B),
                    Color(0xFFF13640),
                    Color(0xFFBD2930),
                  ],
                ),
              ),
              child: const Center(
                child: Text(
                  "sign in",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
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
    );
  }
}

