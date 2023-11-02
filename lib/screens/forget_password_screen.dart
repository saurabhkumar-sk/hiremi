import 'package:flutter/material.dart';
import 'package:flutter_layout/provider/provider.dart';
import 'package:flutter_layout/screens/otp_verification_screen.dart';
import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  void initState() {
    super.initState();
    final provider = UserProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 39, left: 27, right: 300),
              child: SizedBox(
                height: 49,
                width: 49,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ClipOval(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        gradient: const LinearGradient(
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
                        padding: EdgeInsets.only(right: 5),
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
                keyboardType: TextInputType.emailAddress,
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
                  hintText: 'Email Address',
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpVerificationScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF13640),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: const Text(
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
    );
  }
}
