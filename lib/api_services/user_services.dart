import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_layout/api_services/api_urls/api_urls.dart';
import 'package:flutter_layout/api_services/apis/app_exception.dart';
import 'package:flutter_layout/models/api_user.dart';
import 'package:flutter_layout/api_services/base_services.dart';
import 'package:http/http.dart';

class UserService extends BaseService {
  //get
  Future getResponse(String url) async {
    dynamic userMapList;
    try {
      final response = await getHttp(url);
      var data = jsonDecode(response.body.toString());

      userMapList = returnResponse(response);
      userMapList = data;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return userMapList;
  }

//post

  Future<Response> createPostApi(
      Map<String, dynamic> body, String apiUrl) async {
    final response = await postHttp(api: apiUrl, data: body);

    log(response.body);

    return response;
  }

  static dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
