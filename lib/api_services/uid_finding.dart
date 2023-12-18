import 'package:flutter_layout/api_services/api_urls/api_urls.dart';
import 'package:flutter_layout/api_services/apis/api_response.dart';
import 'package:flutter_layout/api_services/base_services.dart';
import 'package:flutter_layout/api_services/user_services.dart';
import 'package:flutter_layout/models/uid_finder_model.dart';

class UidFinding extends UserService {
  List<UidFinder> dataList = [];
  Future<ApiResponse<List<UidFinder>>> getVerificationdetail() async {
    dynamic response = await getResponse(ApiUrls.verificationDetails);
    print(response);
    for (Map<String, dynamic> i in response) {
      dataList.add(UidFinder.fromJson(i));
    }
    print(dataList.toString());
    return ApiResponse.completed(dataList);
  }

  uniqueId(String email) {
    for (UidFinder user in dataList) {
      if (user.userEmail == email) {
        return user.uid;
      }
    }
  }

  lastId() {
    return dataList.length;
  }
}
