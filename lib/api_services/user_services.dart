import 'dart:convert';
import 'dart:developer';

import 'package:flutter_layout/utils/api.dart';
import 'package:flutter_layout/models/api_user.dart';
import 'package:flutter_layout/api_services/base_services.dart';

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

//post

  Future<bool> createPostApi(Map<String, dynamic> body) async {
    final response = await postHttp(api: ApiUrls.registration, data: body);
    log(response.body);

    if (response.statusCode == 201) {
      log('Post Created sucessfully', name: 'createPostApi');
      return true;
    } else {
      log('Some error occured', name: 'error createPostApi');
      return false;
    }
  }
}
