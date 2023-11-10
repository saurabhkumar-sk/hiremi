import 'package:flutter/material.dart';
import 'package:flutter_layout/utils/my_colors.dart';

class SorryForRejection extends StatefulWidget {
  const SorryForRejection({
    super.key,
  });

  @override
  State<SorryForRejection> createState() => _SorryForRejectionState();
}

class _SorryForRejectionState extends State<SorryForRejection> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      title: const Text(
        textAlign: TextAlign.center,
        'Sorry\nYou are Rejected',
        style: TextStyle(
          color: MyColor. pink,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
      content: const Text(
        textAlign: TextAlign.center,
        'We appreciate your application and interview We encourage you to continue developing your skills and consider reapplying in the future.',
        style: TextStyle(
          color: MyColor.black,
          fontWeight: FontWeight.w600,
          fontSize: 10,
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
              child: const Text(
                "Re-apply",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Center(
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
    );
  }
}
