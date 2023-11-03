import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/provider/gender_provider.dart';
import 'package:flutter_layout/screens/login_screen.dart';
import 'package:flutter_layout/utils/my_colors.dart';
import 'package:provider/provider.dart';

enum Gender { male, female }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  UserService ragisterApi = UserService();
  Gender? _gender;

  String genderSelector = "";

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final fatherFirstController = TextEditingController();
  final fatherLastController = TextEditingController();
  final genderController = TextEditingController();
  final emailController = TextEditingController();
  final dateOfBirthDayController = TextEditingController();
  final dateOfBirthMonthController = TextEditingController();
  final dateOfBirthYearController = TextEditingController();
  final birthStateController = TextEditingController();
  final birthcityController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final whatsAppNumberController = TextEditingController();
  final collageStateController = TextEditingController();
  final collageNameController = TextEditingController();
  final branchNameController = TextEditingController();
  final passingYearController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final genderProvider = Provider.of<GenderProvider>(context);

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
                      controller: firstnameController,
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
                      controller: lastnameController,
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
                      controller: fatherFirstController,
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
                      controller: fatherLastController,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Male',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: 'Poppins.bold',
                    color: MyColor.borderColor,
                  ),
                ),
                Radio(
                    fillColor: MaterialStatePropertyAll(
                      genderProvider.isMaleSelected
                          ? MyColor.green
                          : MyColor.grey,
                    ),
                    value: Gender.male,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        genderProvider.toggleGenderSelectionmale();

                        _gender = value;
                      });
                    }),
                const Text(
                  'Female',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: 'Poppins.bold',
                    color: MyColor.radioButtonColor,
                  ),
                ),
                Radio(
                    fillColor: MaterialStatePropertyAll(
                      genderProvider.isFemaleSelected
                          ? MyColor.green
                          : MyColor.grey,
                    ),
                    value: Gender.female,
                    groupValue: _gender,
                    onChanged: (value) {
                      genderProvider.toggleGenderSelectionfemail();

                      setState(() {
                        _gender = value;
                      });
                    }),
              ],
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
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email address';
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
                  hintText: 'acharyarishi79@gmail.com',
                  hintStyle: TextStyle(
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
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      controller: dateOfBirthDayController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter date of birth';
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
                        hintText: 'Day',
                        suffixIcon: IconButton(
                          onPressed: () {},
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
                    width: 100,
                    child: TextFormField(
                      controller: dateOfBirthMonthController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter date of birth';
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
                        hintText: 'Month',
                        suffixIcon: IconButton(
                          onPressed: () {},
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
                    width: 100,
                    child: TextFormField(
                      controller: dateOfBirthYearController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter date of birth';
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
                        hintText: 'Year',
                        suffixIcon: IconButton(
                          onPressed: () {},
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
            Padding(
              padding: const EdgeInsets.only(left: 34, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    // width: 148,

                    width: MediaQuery.of(context).size.width * 0.35,
                    child: TextFormField(
                      controller: birthStateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter birth state';
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
                        hintText: 'State',
                        suffixIcon: IconButton(
                          onPressed: () {},
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
                  const SizedBox(width: 41),
                  SizedBox(
                    // width: 148,
                    width: MediaQuery.of(context).size.width * 0.35,

                    child: TextFormField(
                      controller: birthcityController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter birth city';
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
                        hintText: 'City',
                        suffixIcon: IconButton(
                          onPressed: () {},
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
                controller: phoneNumberController,
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
                controller: whatsAppNumberController,
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
            Padding(
              padding: const EdgeInsets.only(left: 37, right: 58),
              child: TextFormField(
                controller: collageStateController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter collage state';
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
                  hintText: 'College State',
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
                controller: collageNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter collage name';
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
                  hintText: 'Collage Name',
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
                controller: branchNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter branch';
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
                  hintText: 'Branch Name',
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
                controller: passingYearController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter passing year.';
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
                  hintText: 'Passing Year',
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
                controller: passwordController,
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
                controller: conformPasswordController,
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, you can proceed with the input
                      if (passwordController.text.toString() !=
                          conformPasswordController.text.toString()) {
                        return log('please enter correct password');
                      }
                      Map<String, dynamic> body = {
                        "full_name":
                            "${firstnameController.text} ${lastnameController.text}",
                        "father_name":
                            "${fatherFirstController.text} ${fatherLastController.text}",
                        "gender": genderSelector.toString(),
                        "email": emailController.text.toString(),
                        "date_of_birth":
                            "${dateOfBirthDayController.text}-${dateOfBirthMonthController.text}-${dateOfBirthYearController.text}",
                        "birth_place":
                            "${birthStateController.text} ${birthcityController.text}",
                        "phone_number": phoneNumberController.text.toString(),
                        "whatsapp_number":
                            whatsAppNumberController.text.toString(),
                        "college_state": collageStateController.text.toString(),
                        "college_name": collageNameController.text.toString(),
                        "branch_name": branchNameController.text.toString(),
                        "passing_year": passingYearController.text.toString(),
                        "password": passwordController.text.toString(),
                      };
                      ragisterApi.createPostApi(body).then((value) =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen())));
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
