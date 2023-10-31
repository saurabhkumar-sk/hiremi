import 'package:flutter/material.dart';
import 'package:flutter_layout/models/api_user.dart';
import 'package:flutter_layout/api_services/user_services.dart';

class ApiUserScreen extends StatefulWidget {
  const ApiUserScreen({super.key});

  @override
  State<ApiUserScreen> createState() => _ApiUserScreenState();
}

class _ApiUserScreenState extends State<ApiUserScreen> {
  final service = UserService();

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API User Screen'),
      ),
      body: FutureBuilder(
        future: service.getUsersApi(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ApiUser>?> snapshot) {
          return !snapshot.hasData
              ? const Center(child: CircularProgressIndicator())
              : snapshot.hasError || snapshot.data == null
                  ? const Center(child: Text('Something went wrong'))
                  : ListView.separated(
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('ID: ${snapshot.data![index].id.toString()}'),
                            Text(
                                'Full Name : ${snapshot.data![index].fullName}'),
                            Text(
                                'Father name : ${snapshot.data![index].fatherName}'),
                            Text('Gender:  ${snapshot.data![index].gender}'),
                            Text('Email : ${snapshot.data![index].email}'),
                            Text(
                                'Date of birth :${snapshot.data![index].dateOfBirth}'),
                            Text(
                                'BirthPlace : ${snapshot.data![index].birthPlace}'),
                            Text(
                                'phoneNumbar : ${snapshot.data![index].phoneNumbar}'),
                            Text(
                                'whatsappNumber :${snapshot.data![index].whatsappNumber}'),
                            Text(
                                'collegeState : ${snapshot.data![index].collegeState}'),
                            Text(
                                'collegeName : ${snapshot.data![index].collegeName}'),
                            Text(
                                'branchName : ${snapshot.data![index].branchName}'),
                            Text(
                                'passingYear : ${snapshot.data![index].passingYear.toString()}'),
                            Text(
                                'password : ${snapshot.data![index].password}'),
                            Text(
                                'internship : ${snapshot.data![index].internship.toString()}'),
                            Text(
                                'freshers : ${snapshot.data![index].freshers.toString()}'),
                            Text(
                                'experience : ${snapshot.data![index].experience.toString()}'),
                            Text(
                                'mentroship : ${snapshot.data![index].mentroship.toString()}'),
                            Text('status : ${snapshot.data![index].status}'),
                          ],
                        );
                      },
                    );
        },
      ),
    );
  }
}
