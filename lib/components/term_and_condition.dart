import 'package:flutter/material.dart';
import 'package:flutter_layout/components/thanks_for_applying.dart';
import 'package:flutter_layout/screens/job_role_description_screen.dart';
import 'package:flutter_layout/utils/my_colors.dart';

class TermAndCondition extends StatefulWidget {
  const TermAndCondition({
    super.key,
  });

  @override
  State<TermAndCondition> createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> {
  bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const BeveledRectangleBorder(),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      title: const Text('Term & Condition'),
      content: const Text(
        'All the selected students will get a mobile application link, where they have to pay for security deposit Rs.3000 which is refundable only at the time of joining the organization (after completed training). After doing registration then their Employee id will get active and their entire joining process will get started In case any student has done registration then they don\'t want to join the organization so in such a situation amount is not refundable. The offer letter will be released only after registration.\n\n1.Security Deposit: As a part of the joining process, all selected students are required to pay a refundable security deposit of Rs. 3000.',
      ),
      actions: [
        TextButton.icon(
          onPressed: () {
            setState(() {
              checkbox = !checkbox;
            });
          },
          icon: checkbox
              ? const Icon(
                  Icons.check_box_sharp,
                  color: MyColor.pink,
                )
              : const Icon(
                  Icons.check_box_outline_blank_outlined,
                  color: MyColor.grey,
                ),
          label: const Text(
            'Agree With Terms and Condition    ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 28,
              width: 101,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xFFF13640),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Cancle",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            // const SizedBox(width: 10),
            SizedBox(
              height: 28,
              width: 101,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showDialog(
                      context: context,
                      builder: (context) => const JobRoleDescriptionScreen(
                        index: 1,
                      ),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF13640),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Apply",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
