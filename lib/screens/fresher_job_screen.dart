import 'package:flutter/material.dart';
import 'package:flutter_layout/api_services/apis/api_response.dart';
import 'package:flutter_layout/api_services/fresher_joblist.dart';
import 'package:flutter_layout/api_services/user_services.dart';

import 'package:flutter_layout/models/fresher_job_model.dart';
import 'package:flutter_layout/screens/job_description_screen.dart';
import 'package:flutter_layout/utils/my_colors.dart';
import 'package:flutter_layout/utils/my_images.dart';

class FresherJobScreen extends StatefulWidget {
  const FresherJobScreen({super.key});

  @override
  State<FresherJobScreen> createState() => _FresherJobScreenState();
}

class _FresherJobScreenState extends State<FresherJobScreen> {
  final FresherJoblist _fresherJoblist = FresherJoblist();

  @override
  Widget build(BuildContext context) {
    const neverScrollableScrollPhysics = NeverScrollableScrollPhysics();
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
                                  transform: GradientRotation(2),
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
                  const SizedBox(height: 70),
                  FutureBuilder<ApiResponse<List<FresherJobModel>>>(
                      future: _fresherJoblist.getJobListApi(),
                      builder: (context,
                          AsyncSnapshot<ApiResponse<List<FresherJobModel>>>
                              snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 200),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData ||
                            snapshot.data!.data == null) {
                          return const SizedBox(
                              height: 200,
                              child: Center(child: Text('No data available')));
                        } else {
                          List<FresherJobModel> fresherJobList =
                              snapshot.data!.data!;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: neverScrollableScrollPhysics,
                            itemCount: fresherJobList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  height: 210,
                                  // width: 351,
                                  child: Stack(
                                    children: [
                                      Card(
                                        color: const Color(0xFFF8F8F8),
                                        surfaceTintColor: Colors.transparent,
                                        elevation: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0, top: 23, bottom: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                fresherJobList[index]
                                                        .jobProfile ??
                                                    'unknown',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                        color: MyColor.grey7474,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    fresherJobList[index]
                                                            .companyName ??
                                                        'null',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                      fontFamily: 'Poppins',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                        color: MyColor.grey7474,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    fresherJobList[index]
                                                            .jobLocation ??
                                                        'unknown',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                      fontFamily: 'Poppins',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                        color: MyColor.grey7474,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "${fresherJobList[index].jobCtc!} LPA",
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                      fontFamily: 'Poppins',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // left: 190,
                                        top: 168,
                                        right: 10,
                                        child: SizedBox(
                                          height: 27,
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
                                                    id: fresherJobList[index]
                                                        .id!,
                                                    jobProfile:
                                                        fresherJobList[index]
                                                            .jobProfile!,
                                                    jobLocation:
                                                        fresherJobList[index]
                                                            .jobLocation!,
                                                    jobCtc:
                                                        fresherJobList[index]
                                                            .jobCtc!,
                                                    companyName:
                                                        fresherJobList[index]
                                                            .companyName!,
                                                    education:
                                                        fresherJobList[index]
                                                            .education!,
                                                    jobDescreption:
                                                        fresherJobList[index]
                                                            .jobDescription!,
                                                    termsAndConditions:
                                                        fresherJobList[index]
                                                            .termsAndConditions!,
                                                    skillRequired:
                                                        fresherJobList[index]
                                                            .skillsRequired!,
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
                                ),
                              );
                            },
                          );
                        }
                      }),
                ],
              ),
              Positioned(
                top: 45,
                left: 150,
                child: Image.asset(
                  MyImages.saly,
                  height: 210,
                  width: 180,
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
