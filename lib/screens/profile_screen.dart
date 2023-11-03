import 'package:flutter/material.dart';
import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.only(top: 39, left: 27, right: 300),
            child: SizedBox(
              height: 38,
              width: 38,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ClipOval(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      gradient: LinearGradient(
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
                      padding: EdgeInsets.only(right: 10),
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
          const SizedBox(height: 40),
          const Stack(
            children: [
              Row(
                children: [
                  SizedBox(width: 49),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(MyImages.profileImage),
                    radius: 35,
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Rishi ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 26,
                            ),
                          ),
                          Icon(
                            Icons.verified,
                            color: Color.fromARGB(255, 91, 228, 96),
                            size: 35,
                          )
                        ],
                      ),
                      Text(
                        'acharyarishi79@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: MyColor.grey),
                      ),
                      SizedBox(height: 5),
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
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text(
              'Status: N/A',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 43),
          Padding(
            padding: const EdgeInsets.only(left: 55, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.person_outline_outlined,
                  size: 36,
                  color: MyColor.pink,
                ),
                const SizedBox(width: 7),
                const Text(
                  'Personal Info',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: MyColor.pink),
                ),
                const SizedBox(width: 45),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 46, right: 40),
            child: Divider(color: MyColor.brown),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 55, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.security,
                  size: 36,
                  color: MyColor.pink,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Security',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: MyColor.pink),
                ),
                const SizedBox(width: 80),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 46, right: 40),
            child: Divider(color: MyColor.brown),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 55, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.report_outlined,
                  size: 36,
                  color: MyColor.pink,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Privecy Policy',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: MyColor.pink),
                ),
                const SizedBox(width: 30),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 46, right: 40),
            child: Divider(color: MyColor.brown),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 62, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.logout_sharp,
                  size: 36,
                  color: MyColor.pink,
                ),
                SizedBox(width: 20),
                Text(
                  'Sign Out',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: MyColor.pink),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
