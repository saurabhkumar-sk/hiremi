import 'package:flutter/material.dart';
import 'package:flutter_layout/utils/my_colors.dart';

class ThanksForApplying extends StatelessWidget {
  const ThanksForApplying({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: AlertDialog(
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Thank you for apply in Hiremi',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: MyColor.pink,
          ),
        ),
        content: Text.rich(
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
                text: 'position. We\'ll update you after the interview',
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
    );
  }
}
