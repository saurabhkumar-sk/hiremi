import 'package:flutter/material.dart';
import 'package:flutter_layout/api_services/uid_finding.dart';
import 'package:flutter_layout/screens/dashboard_screen.dart';
import 'package:flutter_layout/screens/login_screen.dart';
import 'package:flutter_layout/utils/my_images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogged = prefs.getBool('isLogged') ?? false;

    if (isLogged) {
      // User is already logged in, navigate to the dashboard or another screen
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashbordScreen()),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      // Check login status from SharedPreferences
      checkLoginStatus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(MyImages.hirmilogo),
      ),
    );
  }
}
// Check login status from SharedPreferences
