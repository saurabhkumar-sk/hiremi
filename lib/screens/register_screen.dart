import 'package:flutter/material.dart';
import 'package:flutter_layout/utils/my_colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 39, left: 27, right: 300),
              child: SizedBox(
                height: 49,
                width: 49,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Card(
                    color: Colors.red,
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
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
                    width: 148,
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
                    width: 148,
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
                    width: 148,
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
                    width: 148,
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
            Padding(
              padding: const EdgeInsets.only(left: 37, right: 58),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Male',
                    style: TextStyle(
                      color: MyColor.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      height: 12,
                      width: 12,
                      color: MyColor.checkBoxColor,
                    ),
                  ),
                  const Text(
                    'Female',
                    style: TextStyle(
                      color: MyColor.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      height: 12,
                      width: 12,
                      color: MyColor.checkBoxColor,
                    ),
                  ),
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
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 80,
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
                        hintText: 'Day',
                        suffixIcon: Icon(
                          Icons.expand_more,
                        ),
                        suffixIconColor: MyColor.grey,
                        hintStyle: TextStyle(
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
                        hintText: 'Month',
                        suffixIcon: Icon(
                          Icons.expand_more,
                        ),
                        suffixIconColor: MyColor.grey,
                        hintStyle: TextStyle(
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
                        hintText: 'Year',
                        suffixIcon: Icon(
                          Icons.expand_more,
                        ),
                        suffixIconColor: MyColor.grey,
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
                    width: 148,
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
                        hintText: 'State',
                        suffixIcon: Icon(
                          Icons.expand_more,
                        ),
                        suffixIconColor: MyColor.grey,
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
                    width: 148,
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
                        hintText: 'City',
                        suffixIcon: Icon(
                          Icons.expand_more,
                        ),
                        suffixIconColor: MyColor.grey,
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
            const SizedBox(height: 45),
          ],
        ),
      ),
    );
  }
}
