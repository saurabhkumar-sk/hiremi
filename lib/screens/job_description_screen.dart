import 'package:flutter/material.dart';
import 'package:flutter_layout/components/database.dart';
import 'package:flutter_layout/screens/user_verification_screen.dart';
import 'package:flutter_layout/utils/my_colors.dart';

class JobDescriptionScreen extends StatefulWidget {
  const JobDescriptionScreen({super.key, required this.index});
  final int index;

  @override
  State<JobDescriptionScreen> createState() => _JobDescriptionScreenState();
}

class _JobDescriptionScreenState extends State<JobDescriptionScreen> {
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
                'For the verification\n process',
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
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: ClipOval(
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              surfaceTintColor: Colors.transparent,
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
                  padding: EdgeInsets.only(right: 6),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Text(
                  fresherJob[widget.index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.location_on,
                  color: MyColor.grey7474,
                  size: 17,
                ),
                label: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Location:   ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: MyColor.grey7474,
                        ),
                      ),
                      TextSpan(
                        text: fresherJob[widget.index].panIndia,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.money,
                  color: MyColor.grey7474,
                  size: 17,
                ),
                label: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'CTC :   ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: MyColor.grey7474,
                        ),
                      ),
                      TextSpan(
                        text: fresherJob[widget.index].lpa,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 35),
                child: Text(
                  'Terms & condition applied for freshers.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    color: MyColor.grey7474,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 45),
                child: Divider(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 11),
                child: Text(
                  'About the job',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        essentialDetailsList[index].essentialDetails,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '\u2022 ${essentialDetailsList[index].bussiness}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      Text(
                        '\u2022 ${essentialDetailsList[index].companyName}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          const Size(300, 35),
                        ),
                        child: Text(
                          textAlign: TextAlign.justify,
                          '\u2022 ${essentialDetailsList[index].qualification}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: MyColor.black,
                          ),
                        ),
                      ),
                      Text(
                        '\u2022 ${essentialDetailsList[index].branch}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      Text(
                        '\u2022 ${essentialDetailsList[index].criteria}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      Text(
                        '\u2022 ${essentialDetailsList[index].profile}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      const Text(
                        'Package for freshers :',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '\u2022 ${packgeforfresher[index].ctcEBT}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      Text(
                        '\u2022 ${packgeforfresher[index].ctcBDA}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Location :  ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: fresherJob[widget.index].panIndia,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Bond : ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: fresherJob[widget.index].panIndia,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'BASIC REQUIREMENTS:',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '\u2022 ${basicRequirement[index].text}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      Text(
                        '\u2022 ${basicRequirement[index].text2}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      Text(
                        '\u2022 ${basicRequirement[index].text3}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      Text(
                        '\u2022 ${basicRequirement[index].text4}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      Text(
                        '\u2022 ${basicRequirement[index].text5}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      Text(
                        '\u2022 ${basicRequirement[index].text6}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Skill(s) required:',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: SizedBox(
                              height: 28,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(7)),
                                  elevation: MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 217, 215, 215),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'sales',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: MyColor.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: SizedBox(
                              height: 28,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(7)),
                                  elevation: MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 217, 215, 215),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Marketing',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: MyColor.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: SizedBox(
                              height: 28,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(7)),
                                  elevation: MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 217, 215, 215),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'project management',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: MyColor.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: SizedBox(
                              height: 28,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(7)),
                                  elevation: MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 217, 215, 215),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'convincing skills',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: MyColor.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: SizedBox(
                              height: 28,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(7)),
                                  elevation: MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 217, 215, 215),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Management',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: MyColor.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: SizedBox(
                              height: 28,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(7)),
                                  elevation: MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 217, 215, 215),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'convincing skills',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: MyColor.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
