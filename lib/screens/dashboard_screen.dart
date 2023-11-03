import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout/screens/hello.dart';
import 'package:flutter_layout/screens/profile_screen.dart';
import 'package:flutter_layout/screens/user_verification_screen.dart';
import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({super.key});

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  final controller = TextEditingController();
  late BuildContext oldDialogContext;

  int _currentIndex = 0;
  Color _iconColor = MyColor.grey;

  void _changeIconColor(int index) {
    setState(() {
      _currentIndex = index;
      // Update the icon colors based on the selected index
      _iconColor = MyColor.grey;
    });
  }

  bool dialogShown = false;

  @override
  void initState() {
    super.initState();

    if (!dialogShown) {
      Stream<int>.periodic(const Duration(milliseconds: 100), (t) => t)
          .take(1)
          .listen((t) {
        showDialog(
          barrierDismissible: true,
          useSafeArea: true,
          context: context,
          builder: (BuildContext dialogContext) {
            dialogShown = true;
            return AlertDialog(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              title: const Text(
                'For the verification process',
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
                          builder: (context) => const UserVerificationScreen(),
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
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                // top: 10,
                // right: 5,
                // bottom: 8,
              ),
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
            const SizedBox(height: 10),
            const Stack(
              children: [
                Row(
                  children: [
                    SizedBox(width: 35),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(MyImages.profileImage),
                      radius: 35,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hii  !!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Rishu',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'ID : 10000001',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
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
                                builder: (context) => const ProfileScreen(),
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
