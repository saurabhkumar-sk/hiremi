import 'package:flutter/material.dart';
import 'package:flutter_layout/provider/collage_list.dart';
import 'package:flutter_layout/provider/forget_password_controller.dart';
import 'package:flutter_layout/provider/register_provider.dart';

import 'package:flutter_layout/provider/select_passing_year.dart';
import 'package:flutter_layout/provider/selected_branch.dart';
import 'package:flutter_layout/provider/selected_state_provider.dart';
import 'package:flutter_layout/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
        ChangeNotifierProvider(create: (context) => CollageListProvider()),
        ChangeNotifierProvider(create: (context) => ForgetPasswordProvider()),
        ChangeNotifierProvider(create: (context) => SelectState()),
        ChangeNotifierProvider(create: (context) => SelectedBranch()),
        ChangeNotifierProvider(create: (context) => SelectPassingYear()),
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
