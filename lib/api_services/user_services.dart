import 'dart:convert';
import 'dart:developer';

import 'package:flutter_layout/models/login_model.dart';
import 'package:flutter_layout/utils/api.dart';
import 'package:flutter_layout/models/api_user.dart';
import 'package:flutter_layout/api_services/base_services.dart';
import 'package:http/http.dart';

class UserService extends BaseService {
  Future<List<ApiUser>?> getUsersApi() async {
    try {
      final response = await getHttp(ApiUrls.registration);
      log(response.body, name: 'getUsersApi');
      final userMapList = json.decode(response.body);

      if (response.statusCode != 200) return null;
      List<ApiUser> userList =
          List<ApiUser>.from(userMapList.map((e) => ApiUser.fromJson(e)));

      // log(userMapList.toString(), name: 'getUserApi response');
      return userList;
    } catch (e, s) {
      log(e.toString(), name: 'error getUserApi', stackTrace: s);
      return null;
    }
  }

  List<userModel> responceData = [];

  Future<List<userModel>> getapi() async {
    final responce = await getHttp(ApiUrls.registration);
    var data = jsonDecode(responce.body.toString());
    print(responce.statusCode);
    if (responce.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        responceData.add(userModel.fromJson(i));
      }
      print(responceData.toString());
      return responceData;
    } else {
      return responceData;
    }
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

  uniqueId(String email) {
    for (userModel user in responceData) {
      if (user.email == email) {
        return user.uid;
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

  bool? verificationStatus(String email) {
    for (userModel user in responceData) {
      if (user.email == email) {
        return user.verified; // User is verified
      }
    }

    return false; // No matching user found
  }
//post

  Future<Response> createPostApi(
      Map<String, dynamic> body, String apiUrl) async {
    final response = await postHttp(api: apiUrl, data: body);
    log(response.body);

    return response;
  }
}
