import 'dart:developer';
import 'package:flutter_layout/api_services/api_urls/api_urls.dart';
import 'package:flutter_layout/provider/collage_list.dart';
import 'package:flutter_layout/provider/select_passing_year.dart';
import 'package:flutter_layout/provider/selected_branch.dart';
import 'package:flutter_layout/provider/selected_state_provider.dart';
import 'package:flutter_layout/screens/collage_list.dart';

import 'package:flutter_layout/utils/branch_name_list.dart';
import 'package:flutter_layout/utils/indian_state_list.dart';
import 'package:flutter_layout/utils/passing_year_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/provider/register_provider.dart';
import 'package:flutter_layout/screens/login_screen.dart';
import 'package:flutter_layout/utils/my_colors.dart';
import 'package:provider/provider.dart';
import 'package:csc_picker/csc_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  UserService ragisterApi = UserService();

  bool genderMale = false;
  bool genderFemale = false;
  bool genderOther = false;

  String selectCollage = 'Select Collage';

  String? collagename;

  String errorTextVal = '';
  var uniqueid;

  String genderSelector = "";

  DateTime date = DateTime.now();
  String? day;
  String? month;
  String? year;

  String? countryPicker;
  String? statePicker;
  String? cityPicker;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    var collageProvider = Provider.of<CollageListProvider>(context);
    var selectedBranch = Provider.of<SelectedBranch>(context);
    var selectedPassingYear = Provider.of<SelectPassingYear>(context);

    String selectCollage = collageProvider.selectCollage;

    SelectState selectedState = Provider.of<SelectState>(context);

    if (collageProvider.selectCollage == "Select Collage") {
      collagename = null;
    } else {
      collagename = collageProvider.selectCollage;
    }

    void selectDatePicker() async {
      DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2025),
      );
      if (datePicker != null) {
        if (datePicker.isAfter(DateTime.now())) {
        } else {
          registerProvider.dateOfBirthController.controller.text =
              datePicker.toString().split(" ")[0];
        }
      }
    }

    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 39, left: 27, right: 300),
              child: SizedBox(
                height: 38,
                width: 32,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ClipOval(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        gradient: const LinearGradient(
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
                        padding: EdgeInsets.only(right: 5),
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
            const SizedBox(height: 29),
            const Padding(
              padding: EdgeInsets.only(left: 36),
              child: Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  fontFamily: 'Poppins.bold',
                  color: Color.fromARGB(255, 177, 21, 12),
                ),
              ),
            ),
            const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.only(left: 36),
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(
                  const Size(231, 36),
                ),
                child: const Text(
                  'Create your new account, we are glad that you joined us.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: 'Poppins.bold',
                    color: MyColor.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 49),
            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text(
                'Your Name',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Poppins.bold',
                  color: MyColor.black,
                ),
              ),
            ),
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.only(left: 34, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: TextFormField(
                      controller:
                          registerProvider.firstnameController.controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter name';
                        }
                        return null; // Return null if the input is valid
                      },
                      textInputAction: TextInputAction.done,
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
                        hintText: 'First name',
                        hintStyle: TextStyle(
                          color: MyColor.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: TextFormField(
                      controller:
                          registerProvider.lastnameController.controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter name';
                        }
                        return null; // Return null if the input is valid
                      },
                      textInputAction: TextInputAction.done,
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
                        hintText: 'Last name',
                        hintStyle: TextStyle(
                          color: MyColor.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 52),
            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text(
                'Father Name',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Poppins.bold',
                  color: MyColor.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 34, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,

                    // width: 148,
                    child: TextFormField(
                      controller:
                          registerProvider.fatherFirstController.controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter name';
                        }
                        return null; // Return null if the input is valid
                      },
                      textInputAction: TextInputAction.done,
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
                        hintText: 'First name',
                        hintStyle: TextStyle(
                          color: MyColor.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 41),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,

                    // width: 148,
                    child: TextFormField(
                      controller:
                          registerProvider.fatherLastController.controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter name';
                        }
                        return null; // Return null if the input is valid
                      },
                      textInputAction: TextInputAction.done,
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
                        hintText: 'Last name',
                        hintStyle: TextStyle(
                          color: MyColor.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 54),
            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text(
                'Gender',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Poppins.bold',
                  color: MyColor.black,
                ),
              ),
            ),
            const SizedBox(height: 23),
            Padding(
              padding: const EdgeInsets.only(left: 37, right: 58),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        genderMale = true;
                        genderFemale = false;
                        genderOther = false;
                        genderSelector = "Male";
                        registerProvider.toggleGenderSelectionmale();
                      },
                      child: const Text(
                        'Male',
                        style: TextStyle(
                          color: MyColor.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  ClipOval(
                    child: Container(
                      height: 12,
                      width: 12,
                      color: genderMale ? MyColor.green : MyColor.grey,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        genderFemale = true;
                        genderMale = false;

                        genderOther = false;
                        genderSelector = 'Female';
                        registerProvider.toggleGenderSelectionfemail();
                      },
                      child: const Text(
                        'Female',
                        style: TextStyle(
                          color: MyColor.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  ClipOval(
                    child: Container(
                      height: 12,
                      width: 12,
                      color: genderFemale ? MyColor.green : MyColor.grey,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        genderOther = true;
                        genderFemale = false;
                        genderMale = false;

                        genderSelector = "other";
                        registerProvider.toggleGenderSelectionOther();
                      },
                      child: const Text(
                        'other',
                        style: TextStyle(
                          color: MyColor.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  ClipOval(
                      child: Container(
                    height: 12,
                    width: 12,
                    color: genderOther ? MyColor.green : MyColor.grey,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 45),
            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text(
                'Email',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Poppins.bold',
                  color: MyColor.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 37, right: 58),
              child: TextFormField(
                controller: registerProvider.emailController.controller,
                onChanged: (value) {
                  setState(() {
                    if (value.contains(' ')) {
                      errorTextVal = "Don't use blank spaces";
                    } else if (!value.contains('@gmail.com')) {
                      errorTextVal = "use @gmail.com in the email";
                    } else {
                      errorTextVal = '';
                    }
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email';
                  }
                  // Define a regular expression for email validation.
                  final emailRegex =
                      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  errorText: errorTextVal.isEmpty ? null : errorTextVal,
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
                  hintText: 'email@gmail.com',
                  hintStyle: const TextStyle(
                    color: MyColor.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 51),
            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text(
                'Date of Birth',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Poppins.bold',
                  color: MyColor.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: TextFormField(
                cursorColor: MyColor.grey,
                controller: registerProvider.dateOfBirthController.controller,
                keyboardType: TextInputType.none,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter date of birth';
                  }
                  return null; // Return null if the input is valid
                },
                onTap: () {
                  selectDatePicker();
                },
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
                  suffixIcon: IconButton(
                    onPressed: () {
                      selectDatePicker();
                    },
                    icon: const Icon(
                      Icons.expand_more,
                    ),
                  ),
                  suffixIconColor: MyColor.grey,
                  prefixIcon: IconButton(
                    onPressed: () {
                      selectDatePicker();
                    },
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                    ),
                  ),
                  prefixIconColor: MyColor.grey,
                ),
              ),
            ),
            const SizedBox(height: 65),
            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text(
                'Birth Place',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Poppins.bold',
                  color: MyColor.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 34, right: 40),
              child: CSCPicker(
                flagState: CountryFlag.DISABLE,
                onCountryChanged: (country) {
                  countryPicker = country;
                },
                onStateChanged: (state) {
                  statePicker = state;
                },
                onCityChanged: (city) {
                  cityPicker = city;
                },
              ),
            ),
            const SizedBox(height: 45),
            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text(
                'Contact Number',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Poppins.bold',
                  color: MyColor.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 37, right: 58),
              child: TextFormField(
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: registerProvider.phoneNumberController.controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null; // Return null if the input is valid
                },
                textInputAction: TextInputAction.done,
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
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(
                    color: MyColor.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 37, right: 58),
              child: TextFormField(
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller:
                    registerProvider.whatsAppNumberController.controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter whatsapp number';
                  }
                  return null; // Return null if the input is valid
                },
                textInputAction: TextInputAction.done,
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
                  hintText: 'Whatsapp Number',
                  hintStyle: TextStyle(
                    color: MyColor.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45),
            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text(
                'Complete address',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Poppins.bold',
                  color: MyColor.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 37, right: 58),
              child: TextFormField(
                controller: registerProvider.addressController.controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter address';
                  }
                  return null; // Return null if the input is valid
                },
                textInputAction: TextInputAction.done,
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
                  hintText: 'Address',
                  hintStyle: TextStyle(
                    color: MyColor.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text(
                'College',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Poppins.bold',
                  color: MyColor.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 34),
                  child: Text(
                    "Collage State",
                    style: TextStyle(fontSize: 15.0, color: MyColor.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 20),
                  child: PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) {
                      return IndianStates.states.map((String state) {
                        return PopupMenuItem<String>(
                          value: state,
                          child: Text(state),
                        );
                      }).toList();
                    },
                    onSelected: (String value) {
                      selectedState.selectedState = value;
                      print(selectedState.selectedState);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19, vertical: 8),
                      child: SizedBox(
                        width: 95,
                        child: Text(
                          selectedState.selectedState,
                          style: const TextStyle(
                              fontSize: 15.0, color: MyColor.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 37, right: 58),
              child: Divider(),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 34),
                  child: Text(
                    "Collage name",
                    style: TextStyle(fontSize: 15.0, color: MyColor.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 10),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CollageListScreen(
                                    onCollageSelected: (collageName) {
                                      collageProvider.selectCollage =
                                          collageName;
                                      collagename = collageName;

                                      //  print(collageName);
                                      print(collagename);
                                    },
                                  )),
                        );
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                selectCollage,
                                style: const TextStyle(
                                    fontSize: 15.0, color: MyColor.grey),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 37, right: 58),
              child: Divider(),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 34),
                  child: Text(
                    "Branch name",
                    style: TextStyle(fontSize: 15.0, color: MyColor.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 10),
                  child: PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) {
                      return BranchNameList.branchName.map((String state) {
                        return PopupMenuItem<String>(
                          value: state,
                          child: Text(state),
                        );
                      }).toList();
                    },
                    onSelected: (String value) {
                      selectedBranch.selectedBranch = value;
                      print(selectedBranch.selectedBranch);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19, vertical: 8),
                      child: SizedBox(
                        width: 96,
                        child: Text(
                          selectedBranch.selectedBranch,
                          style: const TextStyle(
                              fontSize: 15.0, color: MyColor.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 37, right: 58),
              child: Divider(),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 34),
                  child: Text(
                    "Passing year",
                    style: TextStyle(fontSize: 15.0, color: MyColor.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 20),
                  child: PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) {
                      return PassingYearList.passingYear.map((String state) {
                        return PopupMenuItem<String>(
                          value: state,
                          child: Text(state),
                        );
                      }).toList();
                    },
                    onSelected: (String value) {
                      selectedPassingYear.selectPassingYear = value;
                      print(selectedPassingYear.selectPassingYear);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19, vertical: 8),
                      child: SizedBox(
                        width: 96,
                        child: Text(
                          selectedPassingYear.selectPassingYear,
                          style: const TextStyle(
                              fontSize: 15.0, color: MyColor.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 37, right: 58),
              child: Divider(),
            ),
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text(
                'Create Password',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Poppins.bold',
                  color: MyColor.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 37, right: 58),
              child: TextFormField(
                controller: registerProvider.passwordController.controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  return null; // Return null if the input is valid
                },
                textInputAction: TextInputAction.done,
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
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Icon(
                      Icons.lock,
                      color: MyColor.grey,
                      size: 22,
                    ),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: MyColor.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 37, right: 58),
              child: TextFormField(
                controller:
                    registerProvider.conformPasswordController.controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  return null; // Return null if the input is valid
                },
                textInputAction: TextInputAction.done,
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
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Icon(
                      Icons.lock,
                      color: MyColor.grey,
                      size: 22,
                    ),
                  ),
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(
                    color: MyColor.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45),
            Center(
              child: SizedBox(
                height: 55.0,
                width: 230,
                child: ElevatedButton(
                  onPressed: () async {
                    //  String? day;
                    // String? month;
                    // String? year;

                    // String? countryPicker;
                    // String? statePicker;
                    // String? cityPicker;
                    // print(day);
                    // print(month);
                    // print(year);
                    print(countryPicker);
                    print(statePicker);
                    print(cityPicker);
                    print(registerProvider.emailController.controller.text);

                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, you can proceed with the input
                      if (registerProvider.passwordController.controller.text
                              .toString() !=
                          registerProvider
                              .conformPasswordController.controller.text
                              .toString()) {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title:
                                  const Text('please enter correct password'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    log(uniqueid);
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
                      Map<String, dynamic> body = {
                        "full_name":
                            "${registerProvider.firstnameController.controller.text} ${registerProvider.lastnameController.controller.text}",
                        "father_name":
                            "${registerProvider.fatherFirstController.controller.text} ${registerProvider.fatherLastController.controller.text}",
                        "gender": genderSelector.toString(),
                        "email": registerProvider
                            .emailController.controller.text
                            .toString(),
                        "date_of_birth": registerProvider
                            .dateOfBirthController.controller.text,
                        "birth_place":
                            "${countryPicker}-${statePicker}-${cityPicker}",
                        "phone_number": registerProvider
                            .phoneNumberController.controller.text,
                        "whatsapp_number": registerProvider
                            .whatsAppNumberController.controller.text,
                        "college_state": selectedState.selectedState,
                        "college_name": collagename,
                        "branch_name": selectedBranch.selectedBranch,
                        "passing_year": selectedPassingYear.selectPassingYear,
                        "password":
                            registerProvider.passwordController.controller.text,
                        "address":
                            registerProvider.addressController.controller.text
                      };
                      print(body);
                      final responce = await ragisterApi.createPostApi(
                          body, ApiUrls.registration);
                      print(responce.statusCode);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => LoginScreen())));
                      if (responce.statusCode == 201) {
                        log(responce.body);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      } else {
                        log('error occurred while creating');
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
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    )));
  }
}
