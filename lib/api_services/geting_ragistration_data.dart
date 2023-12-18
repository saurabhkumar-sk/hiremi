import 'dart:convert';
import 'dart:developer';

import 'package:flutter_layout/api_services/api_urls/api_urls.dart';
import 'package:flutter_layout/api_services/apis/api_response.dart';
import 'package:flutter_layout/api_services/base_services.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/models/login_model.dart';

class GettingRagistrationData extends UserService {
  List<userModel> responceData = [];

  Future<ApiResponse<List<userModel>>> getapi() async {
    dynamic response = await getResponse(ApiUrls.registration);
    print(response);
    for (Map<String, dynamic> i in response) {
      responceData.add(userModel.fromJson(i));
    }
    print(responceData.toString());
    return ApiResponse.completed(responceData);
  }

  bool loginUser(String email, String password) {
    for (userModel user in responceData) {
      if (user.email == email && user.password == password) {
        log("success");
        // Successful login
        return true;
      }
    }
    log("failure");
    // Login failed
    return false;
  }

  userName(String email) {
    for (userModel user in responceData) {
      if (user.email == email) {
        return user.fullName;
      }
    }
  }

  otpValidation(String email) {
    for (userModel user in responceData) {
      if (user.email == email) {
        return user.otp;
      }
    }
  }

  userIndex(String email) {
    for (userModel user in responceData) {
      if (user.email == email) {
        return user.id;
      }
    }
  }

  bool? verificationStatus(String email) {
    for (userModel user in responceData) {
      if (user.email == email) {
        return user.verified; // User is verified
      }
    }

    return false; // No matching user found
  }
}
