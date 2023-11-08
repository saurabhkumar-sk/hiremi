import 'package:flutter/material.dart';
import 'package:flutter_layout/components/database.dart';
import 'package:flutter_layout/utils/my_colors.dart';

class JobDescriptionScreen extends StatefulWidget {
  const JobDescriptionScreen({super.key, required this.index});
  final int index;

  @override
  State<JobDescriptionScreen> createState() => _JobDescriptionScreenState();
}

class _JobDescriptionScreenState extends State<JobDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          // height: 20,
          // width: 20,
          child: GestureDetector(
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
                    label: Text(
                      fresherJob[widget.index].panIndia,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        color: MyColor.grey7474,
                      ),
                    ),
                  ),
                  Text(
                    fresherJob[widget.index].panIndia,
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
                    fresherJob.first.lpa,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 35),
                child: Text(
                  'Terms & condition applied for freshers.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    color: Colors.black,
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
                      ),
                      Text(essentialDetailsList[index].bussiness),
                      Text(essentialDetailsList[index].companyName),
                      Text(essentialDetailsList[index].qualification),
                      Text(essentialDetailsList[index].branch),
                      Text(essentialDetailsList[index].criteria),
                      Text(essentialDetailsList[index].profile),
                      const Text('Package for freshers'),
                      Text(packgeforfresher[index].ctcEBT),
                      Text(packgeforfresher[index].ctcBDA),
                      Text(packgeforfresher[index].location),
                      Text(packgeforfresher[index].bond),
                      const Text('BASIC REQUIREMENTS:'),
                      Text(basicRequirement[index].text),
                      Text(basicRequirement[index].text2),
                      Text(basicRequirement[index].text3),
                      Text(basicRequirement[index].text4),
                      Text(basicRequirement[index].text5),
                      Text(basicRequirement[index].text6),
                      const Text('Skill(s) required:'),
                      Wrap(
                        children: [
                          ElevatedButton(
                            style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 217, 215, 215),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('sales'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 217, 215, 215),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('Marketing'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 217, 215, 215),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('project management'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 217, 215, 215),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('communication skills'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 217, 215, 215),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('Management'),
                          ),
                          ElevatedButton(
                            style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 217, 215, 215),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'convincing skills',
                              style: TextStyle(
                                color: MyColor.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
