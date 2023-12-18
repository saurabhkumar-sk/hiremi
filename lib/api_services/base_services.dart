import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BaseService {
  // getting csrf token

  Future<String?> getStoredCSRFToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('csrfToken');
  }

// for get api
  Future getHttp(String api) async {
    final url = api;
    log(url, name: 'getHttp');

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'content-type': 'application/json',
      },
    );

    return response;
  }

  //for  post api

  Future<http.Response> postHttp({
    required String api,
    required Map<String, dynamic> data,
  }) async {
    final url = api;
    log(url, name: 'postHttp');

    final body = json.encode(data);

    final csrfToken = await getStoredCSRFToken();
    print(csrfToken);
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Cookie': csrfToken.toString(),
      },
      body: utf8.encode(body),
    );

    return response;
  }
}
