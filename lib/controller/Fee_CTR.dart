

import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/consts.dart';
import '../models/fee_record_MDL.dart';
import '../models/pagination_MDL.dart';
import '../services/http.dart';

class FeeCTR {
  String headerkey = 'Authorization';
  loadFeeRecordData({int? pageNo}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token =prefs.getString('token')??"no token found";

    log(token);

    pageNo ??= 1;

    String endPoint = 'feecard?page=$pageNo';

    String bearer = 'Bearer ';
    String response = await APIRequest().getRequest(
        baseUrl: ConstStrings.baseUrlStd,
        endPoint: endPoint,
        headers: {headerkey: bearer + token});
    List<Fee_Record_MDL> feeRecordMdl = [];
    Pagination_MDL? paginationMdl;

    if (response != "") {
      if (jsonDecode(response)['type'] == 'success') {
        log("YES IT Is");
        paginationMdl = Pagination_MDL.fromJson(
            jsonDecode(response)['pagination']);

        if(jsonDecode(response)['data']!=null){

          List<dynamic> jsonResponse = jsonDecode(response)['data'];

          for (var element in jsonResponse) {
            feeRecordMdl.add(Fee_Record_MDL.fromJson(element));
          }

        }




        //return fee_record_mdl;
      }
    } else {
      paginationMdl = Pagination_MDL(
          currentpage: 0, totalpages: 0, totalrows: 0, limit: 0, datarows: 0);
    }
    Map<String, dynamic> data = {
      'pagination': paginationMdl,
      'data': feeRecordMdl
    };
    // return fee_collection_mdl_list;
    return data;

    // log("Length of List = "+exam_mdl_list.length.toString());

    // return exam_mdl_list;
  }

}
