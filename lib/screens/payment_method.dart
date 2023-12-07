import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String environment = "PRODUCTION";
  String appId = "";
  String marchantId = "M2306160483220675579140";
  bool enableLogging = false;
  String checksum = "";
  String callbackUrl =
      "https://webhook.site/504105f3-d92a-45e4-a425-ca057b76ebe0";
  String body = "";
  Object? result;
  String apiEndPoint = "/pg/v1/pay_production";

  getChecksum() {
    final requestData = {
      "merchantId": marchantId,
      "merchantTransactionId": "TX123456789",
      "merchantUserId": "U123456789",
      "amount": 1000,
      "mobileNumber": "9xxxxxxxxx",
      "callbackUrl": callbackUrl,
      "paymentInstrument": {"type": "PAY_PAGE", "targetApp": "com.phonepe.app"},
    };
    String base64Body = base64.encode(utf8.encode(json.encode(requestData)));
    checksum =
        '${sha256.convert(utf8.encode(base64Body + apiEndPoint)).toString()}###';
//checksum =
    //  '${sha256.convert(utf8.encode(base64Body + apiEndPoint + saltKey)).toString()}###$saltIndex';

    return base64Body;
  }

  @override
  void initState() {
    super.initState();
    phonepeInit();

    body = getChecksum().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                startPgTransaction();
              },
              child: Text('pay')),
          const SizedBox(
            height: 20,
          ),
          Text("result \n $result")
        ],
      ),
    );
  }

  void phonepeInit() {
    PhonePePaymentSdk.init(environment, appId, marchantId, enableLogging)
        .then((val) => {
              setState(() {
                result = 'PhonePe SDK Initialized - $val';
              })
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  void startPgTransaction() {
    try {
      var response = PhonePePaymentSdk.startPGTransaction(
          body, callbackUrl, checksum, {}, apiEndPoint, "");
      response
          .then((val) => {
                setState(() {
                  if (val != null) {
                    String status = val['status'].toString();
                    String error = val['error'].toString();

                    if (status == "SUCCESS") {
                      result = "Flow complete - status: SUCCESS";
                    } else {
                      result =
                          "Flow complete - status:$status and error:$error";
                    }
                  } else {
                    result = "Flow incomplete";
                  }
                })
              })
          .catchError((error) {
        handleError(error);
        return <dynamic>{};
      });
    } catch (error) {
      handleError(error);
    }
  }

  void handleError(error) {
    setState(() {
      result = {"error": error};
    });
  }
}
