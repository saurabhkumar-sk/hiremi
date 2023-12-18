import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_layout/api_services/api_urls/api_urls.dart';
import 'package:flutter_layout/api_services/fresher_joblist.dart';
import 'package:flutter_layout/api_services/getApplication_status.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/provider/job_descreption_provider.dart';

import 'package:flutter_layout/screens/dashboard_screen.dart';
import 'package:flutter_layout/screens/fresher_job_screen.dart';

import 'package:flutter_layout/utils/my_colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobDescriptionScreen extends StatefulWidget {
  final String jobProfile;
  final String jobLocation;
  final String jobCtc;
  final String companyName;
  final String education;
  final String jobDescreption;
  final String termsAndConditions;
  final String skillRequired;
  final int id;
  const JobDescriptionScreen({
    super.key,
    required this.jobProfile,
    required this.jobLocation,
    required this.jobCtc,
    required this.companyName,
    required this.education,
    required this.jobDescreption,
    required this.termsAndConditions,
    required this.skillRequired,
    required this.id,
  });

  @override
  State<JobDescriptionScreen> createState() => _JobDescriptionScreenState();
}

class _JobDescriptionScreenState extends State<JobDescriptionScreen> {
  final FresherJoblist _fresherJoblist = FresherJoblist();
  final GetApplicationStatus _getApplicationStatus = GetApplicationStatus();
  final UserService _userService = UserService();
  final jobCodeController = TextEditingController();

  bool dialogShown = true;
  bool termsAndconditionsShown = true;
  String isJobCodeRequired = "";
  int? jobcode;
  String loginEmail = "";
  bool isChecked = false;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await jobCodeRequiredORnot();
    });
    super.initState();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginEmail = prefs.getString('email') ?? '';

    print(loginEmail);
  }

  Future<void> jobCodeRequiredORnot() async {
    checkLoginStatus();
    await _fresherJoblist.getJobListApi();
    await _getApplicationStatus.getApplicationStatus();
    jobcode = _fresherJoblist.jobcode(widget.id);
    print(jobcode);
    isJobCodeRequired = _fresherJoblist.jobCodeRequired(widget.id);

    if (isJobCodeRequired == "No") {
      dialogShown = false;
    }
    if (isJobCodeRequired == "Yes") {
      dialogShown = true;
    }

    if (dialogShown) {
      Stream<int>.periodic(const Duration(milliseconds: 100), (t) => t)
          .take(1)
          .listen((t) {
        showDialog(
          barrierDismissible: false,
          useSafeArea: true,
          context: context,
          builder: (BuildContext dialogContext) {
            // ignore: deprecated_member_use
            return WillPopScope(
              onWillPop: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FresherJobScreen()),
                );
                return Future.value(false);
              },
              child: AlertDialog(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.transparent,
                title: const Text(
                  'Enter job  code',
                  textAlign: TextAlign.center,
                ),
                actionsPadding: const EdgeInsets.only(top: 15, bottom: 25),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: jobCodeController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                                4), // Limit to 6 digits
                          ],
                          decoration: InputDecoration(
                            labelText: 'Enter jobcode',
                            hintText: 'please enter the 4 Digit Code ',
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            if (jobCodeController.text.toString() ==
                                jobcode.toString()) {
                              Navigator.pop(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF13640),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          child: const Text(
                            "Sumbit",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: MyColor.pink,
                ),
              ),
            );
          },
        );
      });
    }
    if (termsAndconditionsShown) {
      Stream<int>.periodic(const Duration(milliseconds: 100), (t) => t)
          .take(1)
          .listen((t) {
        showDialog(
          barrierDismissible: false,
          useSafeArea: true,
          context: context,
          builder: (BuildContext dialogContext) {
            var checkboxModel = Provider.of<CheckboxModel>(context);
            // ignore: deprecated_member_use
            return WillPopScope(
              onWillPop: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FresherJobScreen()),
                );
                return Future.value(false);
              },
              child: AlertDialog(
                shape: const BeveledRectangleBorder(),
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.transparent,
                title: const Text('Term & Condition'),
                content: const Text(
                  'All the selected students will get a mobile application link, where they have to pay for security deposit Rs.3000 which is refundable only at the time of joining the organization (after completed training). After doing registration then their Employee id will get active and their entire joining process will get started In case any student has done registration then they don\'t want to join the organization so in such a situation amount is not refundable. The offer letter will be released only after registration.\n\n1.Security Deposit: As a part of the joining process, all selected students are required to pay a refundable security deposit of Rs. 3000.',
                ),
                actions: [
                  Row(
                    children: [
                      StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        var checkboxModel = Provider.of<CheckboxModel>(context);
                        return Checkbox(
                          value: checkboxModel.isChecked,
                          onChanged: (bool? value) {
                            checkboxModel.toggleCheckbox(value!);

                            print(checkboxModel.isChecked);
                          },
                        );
                      }),
                      const Text(
                        'Agree With Terms and Condition',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
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
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FresherJobScreen()),
                            );
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
                            if (checkboxModel.isChecked) {
                              Navigator.pop(context); // Set the flag to false
                            }
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
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Text(
                  widget.jobProfile,
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
                        text: widget.jobLocation,
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
                        text: widget.jobCtc,
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
                      const Text(
                        "ESSENTIAL DETAILS :",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        widget.jobProfile,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                      Text(
                        'Company Name: ${widget.companyName}',
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
                          'Educational Qualification: ${widget.education}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: MyColor.black,
                          ),
                        ),
                      ),
                      const Text(
                        'Job Descreption :',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        widget.jobDescreption,
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
                              text: widget.jobLocation,
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
                        widget.termsAndConditions,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.skillRequired,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MyColor.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 236,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => DashbordScreen()),
                      // );
                      Map<String, dynamic> body = {
                        "user_email": loginEmail,
                        "job_profile": widget.jobProfile,
                      };

                      final responce = await _userService.createPostApi(
                          body, ApiUrls.jobApplication);
                      print(responce.statusCode);
                      if (responce.statusCode == 201) {
                        log(responce.body);
                        // ignore: use_build_context_synchronously
                        showDialog(
                          barrierDismissible: false,
                          useSafeArea: true,
                          context: context,
                          builder: (BuildContext context) {
                            // ignore: deprecated_member_use
                            return WillPopScope(
                              onWillPop: () async {
                                // Exit the app
                                SystemNavigator.pop();
                                return Future.value(false);
                              },
                              child: const AlertDialog(
                                contentPadding: EdgeInsets.all(
                                    12), // Padding for the content
                                title: Text(
                                  'Thank you for applying in Hiremi',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: MyColor.pink,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        log('error occurred while creating');
                        log(responce.body);
                        final error = responce.body;
                        // ignore: use_build_context_synchronously
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('error'),
                              content: Text(error.toString()),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF13640),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    child: const Text(
                      "Apply",
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
            ],
          ),
        ),
      ),
    );
  }
}
