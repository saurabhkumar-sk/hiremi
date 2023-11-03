import 'dart:convert';
import 'dart:developer';

import 'package:flutter_layout/utils/api.dart';
import 'package:http/http.dart' as http;

class BaseService {
  Future getHttp(String api) async {
    final url = ApiUrls.baseUrl + api;
    log(url, name: 'getHttp');

    final response = await http.get(
      Uri.parse(url),
      headers: {'content-type': 'application/json'},
    );

    return response;
  }

  Future<http.Response> postHttp({
    required String api,
    required Map<String, dynamic> data,
  }) async {
    final url = ApiUrls.baseUrl + api;
    log(url, name: 'postHttp');

    final body = json.encode(data);

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'content-type': 'application/json',
      },
      body: body,
    );

    return response;
  }
}
