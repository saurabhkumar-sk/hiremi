import 'package:flutter_layout/api_services/fresher_joblist.dart';
import 'package:flutter_layout/api_services/getApplication_status.dart';
import 'package:flutter_layout/api_services/geting_ragistration_data.dart';
import 'package:flutter_layout/api_services/uid_finding.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FresherJoblist joblist = FresherJoblist();
  GetApplicationStatus jobstatus = GetApplicationStatus();
  GettingRagistrationData ragistrationData = GettingRagistrationData();
  UidFinding uidFinding = UidFinding();
  group('API Tests', () {
    test('Fetch Data API Test', () async {
      // final data = await joblist.getJobListApi();
      // final jobStatus = await jobstatus.getApplicationStatus();
      // final ragistration = await ragistrationData.getapi();
      final uid = await uidFinding.getVerificationdetail();
      // expect(data, isNotNull);
      // expect(jobStatus, isNotNull);
      // expect(ragistration, isNotNull);
      expect(uid, isNotNull);
    });
  });
}
