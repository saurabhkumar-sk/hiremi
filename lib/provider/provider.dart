import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_layout/models/api_user.dart';
import 'package:flutter_layout/api_services/user_services.dart';

class UserProvider extends ChangeNotifier {
  final service = UserService();

  List<ApiUser> apiUserList = [];

//post
  String? _title;

  set setTitle(String? val) => _title = val;

  String? _body;
  set setbody(String? value) => _body = value;

  String? _userId;
  set setId(String? value) => _body = value;

  Future<void> createPost(
      {required String title,
      required String body,
      required String userId}) async {
    try {
      Map<String, dynamic> data = {
        "title": _title,
        "body": _body,
        "userId": _userId
      };
      await service.createPostApi(data);
    } catch (e, s) {
      log(e.toString(), name: 'error catch createPost', stackTrace: s);
    }
  }
}
