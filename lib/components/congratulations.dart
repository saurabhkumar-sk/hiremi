import 'package:flutter/material.dart';
import 'package:flutter_layout/utils/my_colors.dart';

class Congratulations extends StatefulWidget {
  const Congratulations({
    super.key,
  });

  @override
  State<Congratulations> createState() => _CongratulationsState();
}

class _CongratulationsState extends State<Congratulations> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 371,
      width: 339,
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
                onPressed: () {},
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
  }
}
