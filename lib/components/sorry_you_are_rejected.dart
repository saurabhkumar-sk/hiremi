import 'package:flutter/material.dart';
import 'package:flutter_layout/utils/my_colors.dart';

class SorryYouAreRejected extends StatefulWidget {
  const SorryYouAreRejected({
    super.key,
  });

  @override
  State<SorryYouAreRejected> createState() => _SorryYouAreRejectedState();
}

class _SorryYouAreRejectedState extends State<SorryYouAreRejected> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 252,
      width: 300,
      child: AlertDialog(
        surfaceTintColor: Colors.transparent,
        title: Text(
          textAlign: TextAlign.center,
          'Sorry\nYou are Rejected',
          style: TextStyle(
            color: MyColor.pink,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        content: Text(
          textAlign: TextAlign.center,
          'Your application was not considered due to incomplete submission within the specified timeframe',
          style: TextStyle(
            color: MyColor.black,
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
        ),
        actions: [
          SizedBox(height: 10),
          Center(
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'For Enquire :',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: MyColor.black,
                    ),
                  ),
                  TextSpan(
                    text: 'support@hiremi.in',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
