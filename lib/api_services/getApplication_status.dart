import 'dart:convert';
import 'dart:developer';

import 'package:flutter_layout/api_services/api_urls/api_urls.dart';
import 'package:flutter_layout/api_services/apis/api_response.dart';
import 'package:flutter_layout/api_services/base_services.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/models/applicatio_status_model.dart';

class GetApplicationStatus extends UserService {
  List<ApplicationStatus> applicationList = [];

  Future<ApiResponse<List<ApplicationStatus>>> getApplicationStatus() async {
    dynamic response = await getResponse(ApiUrls.jobApplication);
    print(response);
    for (Map<String, dynamic> i in response) {
      applicationList.add(ApplicationStatus.fromJson(i));
    }
    print(applicationList.toString());
    return ApiResponse.completed(applicationList);
  }

  bool isApplication(String email) {
    for (ApplicationStatus user in applicationList) {
      if (user.userEmail == email && user.accept == true) {
        return true;
      }
    }
    return false;
  }
}
