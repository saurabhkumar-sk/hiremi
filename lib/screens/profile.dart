import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [
        Stack(
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
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
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
      ]),
    );
  }
}
