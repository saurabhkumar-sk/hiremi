import 'package:flutter/material.dart';
import 'package:flutter_layout/utils/my_colors.dart';

enum Gender { male, female }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Gender? _gender;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                          padding: EdgeInsets.only(right: 10),
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
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      fontFamily: 'Poppins.bold',
                      color: MyColor.borderColor,
                    ),
                  ),
                  Radio(
                      fillColor: const MaterialStatePropertyAll(
                        MyColor.borderColor,
                      ),
                      value: Gender.male,
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value;
                        });
                      }),
                  const Text(
                    'Female',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      fontFamily: 'Poppins.bold',
                      color: MyColor.radioButtonColor,
                    ),
                  ),
                  Radio(
                      fillColor: const MaterialStatePropertyAll(
                        MyColor.grey,
                      ),
                      value: Gender.female,
                      groupValue: _gender,
                      onChanged: (value) {
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
                    onPressed: () {},
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
      ),
    );
  }
}
