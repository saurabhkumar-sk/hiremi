import 'dart:convert';
import 'dart:developer';

import 'package:flutter_layout/api_services/api_urls/api_urls.dart';
import 'package:flutter_layout/api_services/apis/api_response.dart';
import 'package:flutter_layout/api_services/base_services.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/models/fresher_job_model.dart';

class FresherJoblist extends UserService {
  List<FresherJobModel> fresherJobList = [];

  Future<ApiResponse<List<FresherJobModel>>> getJobListApi() async {
    dynamic response = await getResponse(ApiUrls.fresherJobs);
    print(response);
    for (Map<String, dynamic> i in response) {
      fresherJobList.add(FresherJobModel.fromJson(i));
    }
    print(fresherJobList.toString());
    return ApiResponse.completed(fresherJobList);
  }

  // cheacking jobcode is required or not
  jobCodeRequired(int id) {
    for (FresherJobModel user in fresherJobList) {
      if (user.id == id) {
        return user.jobCodeRequired;
      }
    }
  }

  // extrecting jobcode
  jobcode(int id) {
    for (FresherJobModel user in fresherJobList) {
      if (user.id == id) {
        return user.jobCode;
      }
    }
  }
}
