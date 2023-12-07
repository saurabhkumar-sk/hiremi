import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/provider/register_provider.dart';
import 'package:flutter_layout/screens/fresher_job_screen.dart';
import 'package:flutter_layout/screens/hello.dart';
import 'package:flutter_layout/screens/login_screen.dart';
import 'package:flutter_layout/screens/payment_method.dart';
import 'package:flutter_layout/screens/user_verification_screen.dart';
import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class DashbordScreen extends StatefulWidget {
  const DashbordScreen({super.key});

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  UserService _userService = new UserService();

  final controller = TextEditingController();

  int _currentIndex = 0;
  Color _iconColor = MyColor.grey;

  void _changeIconColor(int index) {
    setState(() {
      _currentIndex = index;
      // Update the icon colors based on the selected index
      _iconColor = MyColor.grey;
    });
  }

  bool userVerificationScreen = true;
  bool waitingForVerification = true;
  bool applicationStatusShown = true;
  String loginEmail = "";
  String loginPassword = "";
  bool? isVerified;
  String? id;
  String userName = "";
  String uid = 'ID : 10000001';
  bool? isSubmitted;

  void isSubmitForVerify() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSubmitted = prefs.getBool('isSubmitaForVerification');
    print(prefs.getBool('isSubmitaForVerification'));
  }

  @override
  void initState() {
    isSubmitForVerify();
    initialize();
    getUidAndVerification();

    super.initState();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginEmail = prefs.getString('email') ?? '';
    loginPassword = prefs.getString('password') ?? '';
    print(loginEmail + "and" + loginPassword);
  }

  Future<void> initialize() async {
    await checkLoginStatus();

    await getUidAndVerification(); // Make sure to use 'await' here
    // Set the state after getting the uid and verification status
    setState(() {
      if (isVerified == true) {
        uid = "ID : $id";
      } else {
        uid = 'ID : 10000001';
      }
    });

    // Rest of your code...
    showVerificationDialogs();
  }

  void showVerificationDialogs() {
    if (isSubmitted == false || isSubmitted == null) {
      userVerificationScreen = true;
      waitingForVerification = false;
    }

    if (isSubmitted == true) {
      waitingForVerification = true;
      userVerificationScreen = false;
    }

    // Check isVerified condition here to avoid unnecessary dialog
    if (isVerified == true) {
      userVerificationScreen = false;
      waitingForVerification = false;
    }
    if (applicationStatusShown == true) {
      userVerificationScreen = false;
      waitingForVerification = false;
    }
    if (applicationStatusShown) {
      Stream<int>.periodic(const Duration(milliseconds: 100), (t) => t)
          .take(1)
          .listen((t) {
        showDialog(
          barrierDismissible: false,
          useSafeArea: true,
          context: context,
          builder: (BuildContext dialogContext) {
            // ignore: deprecated_member_use
            return WillPopScope(
              onWillPop: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FresherJobScreen()),
                );
                return Future.value(false);
              },
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                surfaceTintColor: Colors.transparent,
                title: Column(
                  children: [
                    Image.asset('assets/images/check (4) 1.png'),
                    const Text(
                      'congratulations',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: MyColor.black,
                      ),
                    ),
                  ],
                ),
                content: const Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'You are selected from off campus\n for Business Development Associate\n\n',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Applied Date : 25/8/2023',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Center(
                    child: SizedBox(
                      height: 34,
                      width: 186,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentMethodScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF13640),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        child: const Row(
                          children: [
                            Text(
                              "Enroll Now    ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      '8:20 hr Left',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      });
    }
    if (userVerificationScreen) {
      Stream<int>.periodic(const Duration(milliseconds: 100), (t) => t)
          .take(1)
          .listen((t) {
        showDialog(
          barrierDismissible: false, // Set to false to make it not removable

          useSafeArea: true,
          context: context,
          builder: (BuildContext context) {
            // ignore: deprecated_member_use
            return WillPopScope(
              onWillPop: () async {
                // Exit the app
                SystemNavigator.pop();
                return Future.value(false);
              },
              child: AlertDialog(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.transparent,
                title: const Text(
                  'For the verification\n process',
                  textAlign: TextAlign.center,
                ),
                actionsPadding: const EdgeInsets.only(top: 15, bottom: 25),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  SizedBox(
                    height: 55.0,
                    width: 236,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const UserVerificationScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF13640),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      child: const Text(
                        "click here",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
                titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: MyColor.pink,
                ),
              ),
            );
          },
        );
      });
    }
    if (waitingForVerification) {
      Stream<int>.periodic(const Duration(milliseconds: 100), (t) => t)
          .take(1)
          .listen((t) {
        showDialog(
          barrierDismissible: false,
          useSafeArea: true,
          context: context,
          builder: (BuildContext context) {
            // ignore: deprecated_member_use
            return WillPopScope(
              onWillPop: () async {
                // Exit the app
                SystemNavigator.pop();
                return Future.value(false);
              },
              child: const AlertDialog(
                contentPadding: EdgeInsets.all(12), // Padding for the content
                title: Text(
                  'Thank you for applying to Hiremi',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: MyColor.pink,
                  ),
                ),
                content: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'You\'ve applied for the ',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: MyColor.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Business Development Associate ',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: MyColor.black,
                          ),
                        ),
                        TextSpan(
                          text:
                              'position. We\'ll update you after the interview',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: MyColor.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      });
    }
  }

  Future<void> getUidAndVerification() async {
    await _userService.getapi();
    await _userService.getApplicationStatus();

    applicationStatusShown = _userService.isApplication(loginEmail);
    print(applicationStatusShown);
    // Checking if the user is verified or not
    isVerified = _userService.verificationStatus(
      loginEmail.toString(),
    );
    print({isVerified, "verification Status"});

    // Getting uuid
    id = _userService.uniqueId(
      loginEmail.toString(),
    );
    print({id, "unique id"});

    userName = _userService.userName(loginEmail.toString());
    print({userName, "user name"});
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(CupertinoIcons.house_fill,
              size: 30, color: _currentIndex == 0 ? Colors.red : _iconColor),
          Icon(CupertinoIcons.bag_fill,
              size: 30, color: _currentIndex == 1 ? Colors.red : _iconColor),
          Icon(CupertinoIcons.person_fill,
              size: 30, color: _currentIndex == 2 ? Colors.red : _iconColor),
        ],
        index: _currentIndex,
        color: MyColor.greyBottomappBar,
        buttonBackgroundColor: MyColor.greyBottomappBar,
        backgroundColor: Colors.white,
        onTap: _changeIconColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                // top: 10,
                // right: 5,
                // bottom: 8,
              ),
              child: InkWell(
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                  height: 22,
                  width: 22,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gradient: LinearGradient(
                      end: Alignment.topRight,
                      transform: GradientRotation(20),
                      colors: [
                        Color(0xFFF13640),
                        Color(0xFFBD2930),
                      ],
                    ),
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 35),
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(MyImages.profileImage),
                      radius: 35,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hii  !!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          userName!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              uid,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            isVerified == true
                                ? const Icon(
                                    Icons.verified,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.warning,
                                    color: Colors.red,
                                  )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const Positioned(
                  right: 51,
                  child: Badge(
                    smallSize: 30,
                    alignment: Alignment.topRight,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                    backgroundColor: Color(0xFFF13640),
                    label: Text('5'),
                    isLabelVisible: true,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.notifications_none_rounded,
                      size: 27,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 19,
                    left: 35,
                    right: 15,
                  ),
                  child: Container(
                    height: 134,
                    width: 318,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      gradient: LinearGradient(
                        transform: GradientRotation(104),
                        colors: [
                          Color(0xFF331A4F),
                          Color(0xFF692C57),
                          Color(0xFF9E3D5C),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 5,
                  child: Image.asset(
                    'assets/images/wepik-export-202306100949116sFt 1.png',
                    height: 150,
                    width: 91,
                  ),
                ),
                Positioned(
                  left: 105,
                  top: 30,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(
                      const Size(234, 46),
                    ),
                    child: const Text(
                      'Launching assessments on the app!',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 105,
                  top: 85,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(
                      const Size(230, 54),
                    ),
                    child: const Text(
                      'Show your verified skills to recruiters and get ahead in your job search journey',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  width: 50,
                  height: 7,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  width: 50,
                  height: 7,
                ),
              ],
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HelloScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 110,
                            width: 120,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)),
                              gradient: LinearGradient(
                                transform: GradientRotation(180),
                                colors: [
                                  Color(0xFFBD2930),
                                  Color(0xFFF13640),
                                ],
                              ),
                            ),
                            child: Image.asset(MyImages.internship),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Internship',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FresherJobScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 110,
                            width: 120,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)),
                              gradient: LinearGradient(
                                transform: GradientRotation(180),
                                colors: [
                                  Color(0xFFBD2930),
                                  Color(0xFFF13640),
                                ],
                              ),
                            ),
                            child: Image.asset(MyImages.fresherjob),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Fresher Job',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HelloScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 110,
                          width: 120,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            gradient: LinearGradient(
                              transform: GradientRotation(180),
                              colors: [
                                Color(0xFFBD2930),
                                Color(0xFFF13640),
                              ],
                            ),
                          ),
                          child: Image.asset(MyImages.experience),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Experience',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HelloScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 110,
                          width: 120,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            gradient: LinearGradient(
                              transform: GradientRotation(180),
                              colors: [
                                Color(0xFFBD2930),
                                Color(0xFFF13640),
                              ],
                            ),
                          ),
                          child: Image.asset(MyImages.mentorship),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Mentorship',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  void clearUserCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogged', false);
    prefs.remove('email');
    prefs.remove('password');
    print(prefs.getString('email'));
    print(prefs.getBool('isLogged'));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFBD2930),
            ),
            child: Center(
              child: Text(
                'Welcome to the hiremi',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Log out',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {
                      clearUserCredentials();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    icon: const Icon(Icons.logout))
              ],
            ),
            onTap: () {
              // Handle item 1 tap
            },
          ),
        ],
      ),
    );
  }
}
