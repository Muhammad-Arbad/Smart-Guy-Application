import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_guy/utils/page_navigation.dart';
import 'package:smart_guy/widgets/scaffold_second.dart';

import '../models/signin_MDL.dart';
import '../services/http.dart';
// import 'package:student_portal_app/controller/fee_heads_CTR.dart';
// import 'package:student_portal_app/controller/grades_CTR.dart';
// import 'package:student_portal_app/controller/me_CTR.dart';
// import 'package:student_portal_app/controller/send_fcm_token.dart';
// import 'package:student_portal_app/controller/subscribe_fcm_topics.dart';
// import 'package:student_portal_app/models/schol_dropdown_list_MDL.dart';
// import 'package:student_portal_app/models/signIn_MDL.dart';
// import 'package:student_portal_app/services/http.dart';
// import 'package:student_portal_app/utils/page_navigation.dart';
// import 'package:student_portal_app/utils/shared_preferences.dart';
// import 'package:student_portal_app/widgets/scaffold_second.dart';

class SignInController {
  int rollNo;
  String password;
  SignInModelClass signInModelClass;
  SharedPreferences prefs;
  // SchoolDropDownListModel schoolDropDownListModel;
  // SignInModelClass signInModelClass;

  SignInController({required this.rollNo,
    required this.password,
    required this.prefs
    //   required this.schoolDropDownListModel})
    // : signInModelClass = SignInModelClass(
    // rollno: rollNo,
    // password: password,
    // clid: schoolDropDownListModel.clid!,
    // tns: schoolDropDownListModel.tns!,
    // dbno: schoolDropDownListModel.dbno!.toString()
  }): signInModelClass = SignInModelClass(
      rollno: rollNo,
      password: password,
      clid: 1,
      tns: 'f12c',
      dbno: '2');

  signIn(BuildContext context) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    String endPoint = 'login';


    // log(signInModelClass.clid!.toString());
    // log(signInModelClass.password!.toString());
    // log(signInModelClass.dbno!.toString());
    // log(signInModelClass.tns!.toString());
    // log(signInModelClass.rollno.toString());
    // log(password.toString());
    // return false;



    var response = await APIRequest().postRequest(

        endPoint: endPoint, body: signInModelClass.toJson(), headers: headers);
// Obtain shared preferences.








    if (jsonDecode(response)['type'] == "error") {
      // log("Error");
      return false;
    }

    else if (jsonDecode(response)['type'] == "success") {

      await prefs.setString('token',jsonDecode(response)['data']['token']);


      // AppSharedPreferences.setStudentToken(jsonDecode(response)['data']['token']);
      // AppSharedPreferences.setExpTime((DateTime.now().add(Duration(hours: int.parse(jsonDecode(response)['data']['validhours']) ))).toString());
      // AppSharedPreferences.setClid(schoolDropDownListModel.clid!);
      // AppSharedPreferences.setDbno(schoolDropDownListModel.dbno!.toString());
      // AppSharedPreferences.setTns(schoolDropDownListModel.tns!);
      // AppSharedPreferences.setPassword(password);
      // AppSharedPreferences.setRollNo(rollNo);
      //
      // AppSharedPreferences.setSelectedSchoolData(SchoolDropDownListModel.encodeSingleObject(schoolDropDownListModel));


      // log(AppSharedPreferences.getStudentToken());
      // log(AppSharedPreferences.getExpTime().toString());
      // log(AppSharedPreferences.getClid().toString());
      // log(AppSharedPreferences.getDbno().toString());
      // log(AppSharedPreferences.getRollNo().toString());
      // log(AppSharedPreferences.getPassword().toString());

      //
      //
      // log(rollNo.runtimeType.toString());


      // await  NotificationServices(context: context).initNotification();

      // await MeCTR().loadMeData();
      // await MeCTR().loadMeImageMdl();
      // await FeeHeadsCTR().loadFeeHeadsNames();
      // await GradesCTR().loadGradesData();
      // await SubscribeFCMTopics().subscribeToFcmTopics();
      //
      // String fcmToken = AppSharedPreferences.getFcmToken();
      // // log("fcmToken $fcmToken");
      // await SendToken().sendFcmToken({'token':fcmToken});




     ScreenNavigationSlide.navigateReplacement(context,const ScaffoldSecond());




      return true;

    }
    else{

      return false;

    }
  }
}
