import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout/screens/hello.dart';
import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({super.key});

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ClipOval(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 13,
              top: 10,
              right: 5,
              bottom: 8,
            ),
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                gradient: LinearGradient(
                  // begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  transform: GradientRotation(20),
                  colors: [
                    Color(0xFFF13640),
                    Color(0xFFBD2930),
                  ],
                ),
              ),
              child: IconButton(
                alignment: Alignment.center,
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 19),
              const Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/dp.webp'),
                        radius: 40,
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
                      smallSize: 21,
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
              const SizedBox(height: 40),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 5),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 0.8,
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/wepik-export-202306100949116sFt 1.png',
                    ),
                  ),
                  Positioned(
                    left: 85,
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
                    left: 85,
                    top: 90,
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
              const SizedBox(height: 16),
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
              const SizedBox(height: 36),
              Row(
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
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              transform: GradientRotation(180),
                              colors: [
                                Color(0xFFBD2930),
                                Color(0xFFF13640),
                              ],
                            ),
                          ),
                          child: Image.asset(
                            MyImages.internship,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          'Internship',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 27),
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
                          log(controller.text);
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          // color: Colors.red,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              transform: GradientRotation(180),
                              colors: [
                                Color(0xFFBD2930),
                                Color(0xFFF13640),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              MyImages.internship,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Fresher',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
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
                          log(controller.text);
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          // color: Colors.red,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              transform: GradientRotation(180),
                              colors: [
                                Color(0xFFBD2930),
                                Color(0xFFF13640),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              MyImages.internship,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Experience',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
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
                          log(controller.text);
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          // color: Colors.red,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              transform: GradientRotation(180),
                              colors: [
                                Color(0xFFBD2930),
                                Color(0xFFF13640),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              MyImages.internship,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Mentorship',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
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
