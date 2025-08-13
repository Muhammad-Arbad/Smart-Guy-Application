import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


import '../constants/consts.dart';


class APIRequest {
  int timeOutInSeconds = 15;
  // int timeOutInSeconds = 150;

  //
  // Future<List> fetchTokenInfo(String token) async {
  //
  //   final url = Uri.parse(
  //       'https://fcm.googleapis.com/v1/projects/school-mobile-app-flutter/registrationTokens/$token');
  //
  //   final response = await http.get(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer 6e072b5a65203320a577bab84adaabb5ce482a67',
  //       // Replace with your server key
  //     },
  //   );
  //
  //   // final response = await http.get(
  //   //   url,
  //   //   headers: {
  //   //     'Content-Type': 'application/json',
  //   //     'Authorization':
  //   //     // 'Authorization':
  //   //     'Bearer 6e072b5a65203320a577bab84adaabb5ce482a67', // Replace with your server key
  //   //     // 'key=AAAAKGHdrCY:APA91bHMaiuIryFPTqI3FHASxK5lq_IcHVedTfAMWQzSzymtnbtTYtIPB02rSTKMk85eldDn00aj3KwmLmANiVuV0GAfbqWBm4oquVpKfLMJnq_xwnp7f7ykgXp8oeDp4a-MjaqiJgRe', // Replace with your server key
  //   //   },
  //   // );
  //
  //   // school-mobile-app-flutter
  //   // 6e072b5a65203320a577bab84adaabb5ce482a67
  //
  //   if (response.statusCode == 200) {
  //
  //     return jsonDecode(response.body)['rel']['topics'].keys.toList();
  //   } else {
  //
  //     // print('Response failed with status: ${response.statusCode}');
  //     return [];
  //   }
  // }
  //
  getRequest(
      {required baseUrl,
        required String endPoint,
        required Map<String, String> headers}) async {
    var response;



    try {
      response = await http.get(
        Uri.parse(baseUrl + endPoint),
        headers: headers,
      )
          .timeout(Duration(seconds: timeOutInSeconds), onTimeout: () {
        Fluttertoast.showToast(
            msg: "Internet connection slow try again",
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red);
        throw "Internet connection slow try Again";
      });

      log('response.statuscode.toString()');
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(msg: "Not Authorized");
      } else if (response.statusCode == 404) {
        return response.body;
      } else {
        // log("Record not found");
        // print(response.reasonPhrase);
        return "";
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg:
          "No internet connection, Check your network connection  and try again",
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red);
      // log("No internet connection");
      response = "";
      return response;
    } catch (e) {
      // log(e.toString());
      response = "";
      return response;
    }
  }

  // getRequestToSavePDF(
  //     {
  //       required pdfName,
  //       required baseUrl,
  //       required String endPoint,
  //       required Map<String, String> headers}) async {
  //   var response;
  //
  //   // log(baseUrl + endPoint);
  //
  //   try {
  //     response = await http
  //         .get(
  //       Uri.parse(baseUrl + endPoint),
  //       headers: headers,
  //     ).timeout(Duration(seconds: timeOutInSeconds+15), onTimeout: () {
  //       Fluttertoast.showToast(
  //           msg: "Internet connection slow try again",
  //           gravity: ToastGravity.CENTER,
  //           backgroundColor: Colors.red);
  //       throw "Internet connection slow try Again";
  //     });
  //
  //     // log(response.statusCode.toString());
  //     if (response.statusCode == 200) {
  //
  //
  //       Directory? directory =
  //       Platform.isAndroid?
  //       await getExternalStorageDirectory():
  //       await getApplicationDocumentsDirectory();
  //
  //
  //       final fullPath = '${directory?.path}/${ConstStrings.localeStorageBaseName}/${ME_Model().rOLLNO}_${ME_Model().cLID}/${ConstStrings.localeStorageFeeCard}';
  //
  //       Directory(fullPath).createSync(recursive: true);
  //       // File? file;
  //       final path = '$fullPath/$pdfName.pdf';
  //       // log(path.toString());
  //       File? file = File(path);
  //       // log(file.toString());
  //       // log("opening file");
  //       try {
  //         // log("inside try");
  //         await file.writeAsBytes(response.bodyBytes);
  //         // log("File write successfullt");
  //         return true;
  //       } on FileSystemException catch (err) {
  //         // log("Error Error");
  //         // log(err.toString());
  //         return false;
  //       }
  //
  //       // return true;
  //     } else if (response.statusCode == 401) {
  //       Fluttertoast.showToast(msg: "Not Authorized");
  //       return false;
  //     } else if (response.statusCode == 404) {
  //       return false;
  //     } else {
  //       return false;
  //     }
  //   } on SocketException catch (_) {
  //     Fluttertoast.showToast(
  //         msg:
  //         "No internet connection, Check your network connection  and try again",
  //         gravity: ToastGravity.CENTER,
  //         backgroundColor: Colors.red);
  //     // log("No internet connection");
  //     // response = "";
  //     // return response;
  //     return false;
  //   } catch (e) {
  //     // log(e.toString());
  //     // response = "";
  //     // return response;
  //     return false;
  //   }
  // }
  //
  // getRequestToSavePDFWithBody({
  //   required String pdfName,
  //   required String baseUrl,
  //   required String endPoint,
  //   required Map<String, String> headers,
  //   required Map<String, dynamic> body,
  // }) async {
  //   http.StreamedResponse response;
  //
  //   try {
  //     var request = http.Request('GET', Uri.parse(baseUrl + endPoint));
  //     request.body = json.encode(body);
  //     request.headers.addAll(headers);
  //
  //     response = await request.send().timeout(
  //       Duration(seconds: timeOutInSeconds + 900),
  //       onTimeout: () {
  //         Fluttertoast.showToast(
  //           msg: "Internet connection slow try again",
  //           gravity: ToastGravity.CENTER,
  //           backgroundColor: CustomAppColors.redColor,
  //         );
  //         throw "Internet connection slow try Again";
  //       },
  //     );
  //
  //     // log("response = ${response.statusCode}");
  //
  //     if (response.statusCode == 200) {
  //       final bytes = await response.stream.toBytes();
  //
  //       Directory? directory = Platform.isAndroid
  //           ? await getExternalStorageDirectory()
  //           : await getApplicationDocumentsDirectory();
  //
  //       final fullPath = '${directory?.path}/${ConstStrings.localeStorageBaseName}/${ME_Model().rOLLNO}_${ME_Model().cLID}/${ConstStrings.localeStorageTestResult}';
  //
  //
  //       Directory(fullPath).createSync(recursive: true);
  //       final path = '$fullPath/$pdfName.pdf';
  //
  //
  //
  //       File file = File(path);
  //
  //       try {
  //         // log("TRY");
  //         await file.writeAsBytes(bytes);
  //         return true;
  //       } on FileSystemException catch (err) {
  //         // log("CATCH");
  //         // log("File write error: $err");
  //         return false;
  //       }
  //     } else if (response.statusCode == 401) {
  //       Fluttertoast.showToast(msg: "Not Authorized");
  //       return false;
  //     } else if (response.statusCode == 404) {
  //       return false;
  //     } else {
  //       return false;
  //     }
  //   } on SocketException catch (_) {
  //     Fluttertoast.showToast(
  //       msg: "No internet connection, Check your network connection and try again",
  //       gravity: ToastGravity.CENTER,
  //       backgroundColor: CustomAppColors.redColor,
  //     );
  //     return false;
  //   } catch (e) {
  //     return false;
  //   }
  // }
  //
  // getRequestImage(
  //     {required baseUrl,
  //       required String endPoint,
  //       required Map<String, String> headers}) async {
  //   var response;
  //
  //   try {
  //     response = await http.get(
  //       Uri.parse(baseUrl + endPoint),
  //       headers: headers,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       return response;
  //     } else if (response.statusCode == 401) {
  //       Fluttertoast.showToast(msg: "Not Authorized");
  //       // NavigationService.instance.navigateToReplacement("login");
  //       // return "{}";
  //     } else {
  //       // log("Record not found");
  //       // print(response.reasonPhrase);
  //     }
  //   } on SocketException catch (_) {
  //     Fluttertoast.showToast(
  //         msg:
  //         "No internet connection, Check your network connection  and try again",
  //         gravity: ToastGravity.CENTER,
  //         backgroundColor: Colors.red);
  //     // log("No internet connection");
  //     response = "";
  //     return response;
  //   } catch (e) {
  //     response = "";
  //     return response;
  //   }
  // }
  //
  // getRequestTimelineWithBody(
  //     {
  //       String? baseUrl,
  //       required String endPoint,
  //       required Map<String, String> header,
  //       required Map<String, dynamic> body}) async {
  //   var headers = header;
  //   http.StreamedResponse response;
  //
  //   try{
  //
  //
  //     var request = baseUrl!=null?
  //     http.Request('GET', Uri.parse(baseUrl + endPoint)):
  //     http.Request('GET', Uri.parse(ConstStrings.baseUrlStd + endPoint));
  //     request.body = json.encode(body);
  //
  //     request.headers.addAll(headers);
  //     // log(body.toString());
  //
  //     response = await request.send();
  //
  //
  //     if (response.statusCode == 200) {
  //       return await response.stream.bytesToString();
  //     } else {
  //       // print(response.reasonPhrase);
  //       return "";
  //     }
  //
  //
  //   }on SocketException catch (_) {
  //     Fluttertoast.showToast(
  //         msg:
  //         "No internet connection, Check your network connection  and try again",
  //         gravity: ToastGravity.CENTER,
  //         backgroundColor: Colors.red);
  //     // log("No internet connection");
  //     // response = "";
  //     return "";
  //   } catch (e) {
  //     // response = "";
  //     return "";
  //   }
  // }

  Future<String> postRequest(
      {required String endPoint,

        required Map<String, dynamic> body,
        required Map<String, String> headers}) async {
    // log("before sendign response");

    var response = await http.post(
        Uri.parse(ConstStrings.baseUrlStd + endPoint),
        body: json.encode(body),
        headers: headers);

    // log("response.statusCode");
    // log(response.statusCode.toString());

    if (response.statusCode == 200) {
      // log(response.body);
      return response.body;
    } else {
      // log("response.body");
      // log(response.body);
      return response.body;
    }
  }
}

// getRequestStudent({required String endPoint,required Map<String, String> headers})async{
//
//   log(endPoint);
//   log(headers.toString());
//
//   var response = await http.get(
//     Uri.parse(baseURL_Std + endPoint),
//     headers: headers,
//   );
//
//   log(response.statusCode.toString());
//   if (response.statusCode == 200) {
//     // print(jsonDecode(response.body)['data']);
//     return response.body;
//   }
//   else {
//     log("Record not found");
//     print(response.reasonPhrase);
//   }
//
// }
//
// getRequestData({required String endPoint,required Map<String, String> headers})async{
//
//   var response = await http.get(
//       Uri.parse(baseURL_Dta + endPoint),
//       headers: headers
//   );
//
//
//   if (response.statusCode == 200) {
//
//     return response.body;
//   }
//   else {
//     log("Record not found");
//     print(response.reasonPhrase);
//   }
//
// }
//
// getRequestTns({required String endPoint,required Map<String, String> headers})async{
//
//   var response = await http.get(
//       Uri.parse(baseURLTns + endPoint),
//       headers: headers
//   );
//
//
//   if (response.statusCode == 200) {
//     // print(jsonDecode(response.body)['data']);
//     return response.body;
//   }
//   else {
//     log("Record not found");
//     print(response.reasonPhrase);
//   }
//
// }
//
// getRequestSms({required String endPoint,required Map<String, String> headers})async{
//
//   log(baseURLSms + endPoint);
//
//   var response = await http.get(
//       Uri.parse(baseURLSms + endPoint),
//       headers: headers
//   );
//
//
//   if (response.statusCode == 200) {
//     // print(jsonDecode(response.body)['data']);
//     log("200");
//     return response.body;
//   }
//   else {
//     log("Record not found");
//     print(response.reasonPhrase);
//   }
//
// }
