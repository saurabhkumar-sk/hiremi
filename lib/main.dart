import 'package:flutter/material.dart';
import 'package:flutter_layout/components/database.dart';
import 'package:flutter_layout/provider/register_provider.dart';
import 'package:flutter_layout/provider/provider.dart';
import 'package:flutter_layout/screens/job_description_screen.dart';
import 'package:flutter_layout/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hiremi',
        theme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
