import 'package:flutter/material.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/components/database.dart';
import 'package:flutter_layout/screens/application_review_dashboard.dart';
import 'package:flutter_layout/screens/dashboard_screen.dart';
import 'package:flutter_layout/utils/api.dart';
import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserVerificationScreen extends StatefulWidget {
  const UserVerificationScreen({super.key});

  @override
  State<UserVerificationScreen> createState() => _UserVerificationScreenState();
}

class _UserVerificationScreenState extends State<UserVerificationScreen> {
  UserService _userService = UserService();
  TextEditingController scheduleDateController = TextEditingController();
  TextEditingController scheduleTimeController = TextEditingController();
  TextEditingController collageIdController = TextEditingController();
  TextEditingController descreptionController = TextEditingController();
  double? rateYourComm;
  String yourSkill = "";

//Date Picker
  void selectDatePicker() async {
    DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (datePicker != null) {
      setState(() {
        scheduleDateController.text = datePicker.toString().split(" ")[0];
      });
    }
  }

  //Time Picker
  void selectTimePicker() async {
    final TimeOfDay? timePicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (timePicker != null) {
      setState(() {
        scheduleTimeController.text =
            '${timePicker.hour} : ${timePicker.minute}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leadingWidth: 60,
      //   toolbarHeight: 54,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5),
      //     child: SizedBox(
      //       height: 40,
      //       width: 40,
      //       child: GestureDetector(
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //         child: ClipOval(
      //           child: Card(
      //             elevation: 5,
      //             shadowColor: Colors.black,
      //             shape: const RoundedRectangleBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(25)),
      //             ),
      //             surfaceTintColor: Colors.transparent,
      //             child: Container(
      //               decoration: const BoxDecoration(
      //                 borderRadius: BorderRadius.all(Radius.circular(25)),
      //                 gradient: LinearGradient(
      //                   begin: Alignment.topLeft,
      //                   end: Alignment.topRight,
      //                   transform: GradientRotation(20),
      //                   colors: [
      //                     Color(0xFFF13640),
      //                     Color(0xFFBD2930),
      //                   ],
      //                 ),
      //               ),
      //               child: const Padding(
      //                 padding: EdgeInsets.only(right: 6),
      //                 child: Icon(
      //                   Icons.arrow_back_ios_new,
      //                   size: 30,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      //   centerTitle: true,
      //   title: Image.asset(
      //     MyImages.hirmilogo,
      //     height: 186,
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: ClipOval(
                            child: Card(
                              elevation: 5,
                              shadowColor: Colors.black,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              surfaceTintColor: Colors.transparent,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
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
                      const SizedBox(width: 25),
                      Image.asset(
                        MyImages.hirmilogo,
                        height: 186,
                        width: 186,
                      )
                    ],
                  ),
                  const Positioned(
                    top: 130,
                    left: 55,
                    child: Text(
                      'Verify Your Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: MyColor.pink,
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                'College Id / Enrollment No',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              TextFormField(
                controller: collageIdController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColor.borderColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColor.borderColor,
                    ),
                  ),
                  hintText: '0111it2******',
                  hintStyle: TextStyle(
                    color: MyColor.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Your Skills',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  width: 200,
                  child: DropdownMenu<String>(
                    hintText: 'Ex-Developer',
                    // width: 340,
                    onSelected: (String? value) {
                      yourSkill = value!;
                    },
                    dropdownMenuEntries: exDeveloperlist
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Rate your Communication',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 5),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.green,
                    ),
                    onRatingUpdate: (rating) {
                      rateYourComm = rating;
                      print(rateYourComm);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                'Describe Yourself',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: descreptionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 235, 234, 234),
                  hintText: 'Type here...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                ),
                maxLength: 300,
                minLines: 2,
                maxLines: 10,
              ),
              const SizedBox(height: 5),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Schedule Date',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Schedule Time',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    // width: 148,
                    width: MediaQuery.of(context).size.width * 0.35,

                    child: TextFormField(
                      controller: scheduleDateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter date';
                        }
                        return null; // Return null if the input is valid
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColor.borderColor,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColor.borderColor,
                          ),
                        ),
                        hintText: DateTime.now().toString().split(" ")[0],
                        suffixIcon: IconButton(
                          onPressed: () {
                            selectDatePicker();
                          },
                          icon: const Icon(
                            Icons.expand_more,
                          ),
                        ),
                        suffixIconColor: MyColor.grey,
                        hintStyle: const TextStyle(
                          color: MyColor.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    // width: 148,
                    width: MediaQuery.of(context).size.width * 0.35,

                    child: TextFormField(
                      controller: scheduleTimeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter valid time';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.none,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColor.borderColor,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColor.borderColor,
                          ),
                        ),
                        hintText: '6 PM',
                        suffixIcon: IconButton(
                          onPressed: () {
                            selectTimePicker();
                          },
                          icon: const Icon(
                            Icons.expand_more,
                          ),
                        ),
                        suffixIconColor: MyColor.grey,
                        hintStyle: const TextStyle(
                          color: MyColor.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                '*If our connection isn\'t possible on the specified date, we\'ll reach out to arrange another suitable time.',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: SizedBox(
                  height: 40,
                  width: 170,
                  child: ElevatedButton(
                    onPressed: () async {
                      Map<String, dynamic> body = {
                        "college_id_number": "1",
                        "communication_skills": "5",
                        "status": "dskdsokosk"
                      };
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         DashbordScreen(),
                      //   ),
                      // );
                      var response = await _userService.createPostApi(
                          body, ApiUrls.verificationDetails);
                      print(response.statusCode);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF13640),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    child: const Text(
                      "Sumbit",
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
