import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout/screens/hello.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.red, // Change Custom Drawer Icon Color
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const <Widget>[
          Icon(CupertinoIcons.home, size: 30, color: Colors.white),
          Icon(CupertinoIcons.bag, size: 30, color: Colors.white),
          Icon(CupertinoIcons.person, size: 30, color: Colors.white),
        ],
        color: Colors.grey.shade300,
        buttonBackgroundColor: Colors.red,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Stack(
                      children: [
                        Icon(
                          Icons.notifications_none_sharp,
                          size: 30,
                        ),
                        Positioned(left: 18, child: Badge())
                      ],
                    ),
                  ),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/dp.webp'),
                    radius: 40,
                  ),
                  title: Text(
                    'Hii  !!',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rishu',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        'ID : 10000001',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width * 0.77,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 238, 47, 111),
                          Color.fromARGB(255, 97, 54, 68),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/WhatsApp Image 2023-10-23 at 13.31.37_3cf9394c.png',
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 28,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(
                      const Size(180, 50),
                    ),
                    child: const Text(
                      'Launching asseeements on the app !',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 75,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(
                      const Size(210, 60),
                    ),
                    child: const Text(
                      'Show your verified skills to  requiters and get ahead in your job search journy',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                width: 100,
                height: 10,
              ),
            ),
            const SizedBox(height: 15),
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
                          gradient: SweepGradient(
                            colors: [
                              Color.fromARGB(255, 183, 5, 5),
                              Color.fromARGB(255, 183, 5, 5),
                              Color.fromARGB(255, 237, 18, 18),
                              Color.fromARGB(255, 237, 18, 18),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/images/[CITYPNG.COM]HD Handshake White Icon Symbol Transparent Background - 1000x1000.png',
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Internship',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      // color: Colors.red,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: SweepGradient(
                          colors: [
                            Color.fromARGB(255, 183, 5, 5),
                            Color.fromARGB(255, 183, 5, 5),
                            Color.fromARGB(255, 237, 18, 18),
                            Color.fromARGB(255, 237, 18, 18),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/clipart331011.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Fresher Job',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
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
                    Container(
                      height: 100,
                      width: 100,
                      // color: Colors.red,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: SweepGradient(
                          colors: [
                            Color.fromARGB(255, 183, 5, 5),
                            Color.fromARGB(255, 183, 5, 5),
                            Color.fromARGB(255, 237, 18, 18),
                            Color.fromARGB(255, 237, 18, 18),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/pngegg.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Experience',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: SweepGradient(
                          colors: [
                            Color.fromARGB(255, 183, 5, 5),
                            Color.fromARGB(255, 183, 5, 5),
                            Color.fromARGB(255, 237, 18, 18),
                            Color.fromARGB(255, 237, 18, 18),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/education-10-64.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Mentorship',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
