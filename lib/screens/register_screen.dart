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
                    elevation: 10,
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
                  color: Color.fromARGB(255, 177, 21, 10),
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
              padding: const EdgeInsets.only(left: 34, right: 20),
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
              padding: const EdgeInsets.only(left: 34, right: 20),
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
            const Row(
              children: [
                Text('Male'),
                Text('Male'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
