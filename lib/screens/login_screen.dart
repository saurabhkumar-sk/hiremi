import 'package:flutter/material.dart';
import 'package:flutter_layout/utils/my_images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 101, right: 97, top: 122),
            child: Image.asset(MyImages.hirmilogo),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 200),
            child: const Text(
              'Let\'s gets started.',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
