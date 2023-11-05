import 'package:flutter/material.dart';
import 'package:flutter_layout/components/database.dart';
import 'package:flutter_layout/screens/job_description_screen.dart';
import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';

class FresherJobScreen extends StatefulWidget {
  const FresherJobScreen({super.key});

  @override
  State<FresherJobScreen> createState() => _FresherJobScreenState();
}

class _FresherJobScreenState extends State<FresherJobScreen> {
  @override
  Widget build(BuildContext context) {
    const neverScrollableScrollPhysics = const NeverScrollableScrollPhysics();
    return Scaffold(
      body: SingleChildScrollView(
        // physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.only(top: 75),
                    child: SizedBox(
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
                  ),
                  const SizedBox(height: 50),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: neverScrollableScrollPhysics,
                    itemCount: fresherJob.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Card(
                          color: const Color(0xFFF8F8F8),
                          surfaceTintColor: Colors.transparent,
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 18.0, top: 23, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  fresherJob[index].title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.business_outlined,
                                        color: MyColor.grey7474,
                                        size: 17,
                                      ),
                                      label: const Text(
                                        'Company:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          color: MyColor.grey7474,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      fresherJob[index].company,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.location_on,
                                        color: MyColor.grey7474,
                                        size: 17,
                                      ),
                                      label: const Text(
                                        'Location:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          color: MyColor.grey7474,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      fresherJob[index].panIndia,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextButton.icon(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.money,
                                            color: MyColor.grey7474,
                                            size: 17,
                                          ),
                                          label: const Text(
                                            'CTC:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              color: MyColor.grey7474,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          fresherJob[index].lpa,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      left: 170,
                                      top: 18,
                                      child: SizedBox(
                                        height: 30,
                                        width: 145,
                                        child: ElevatedButton(
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Color(0xFFBD232B))),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    JobDescriptionScreen(
                                                  index: index,
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Row(
                                            children: [
                                              Text(
                                                'View details',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.white,
                                                size: 20,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Positioned(
                top: 45,
                left: 122,
                child: Image.asset(
                  MyImages.saly,
                  height: 210,
                  width: 261,
                ),
              ),
              const Positioned(
                top: 175,
                child: Text(
                  'Fresher Job',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
