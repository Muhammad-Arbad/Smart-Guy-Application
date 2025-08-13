
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:smart_guy/widgets/custom_circular_progress.dart';
import 'package:smart_guy/models/fee_record_MDL.dart';
import '../controller/Fee_CTR.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool loadinglist =false;
  List<Fee_Record_MDL> list = [];
  @override
  void initState(){
    super.initState();
    log("Load the user data before calling ----------------------------------");
    loadStudentFeeData();
  }

  loadStudentFeeData({int? PgNo})async{
setState(() {
  loadinglist=true;
});
Map<String, dynamic> data =
await FeeCTR().loadFeeRecordData(pageNo: PgNo);
list = data['data'];

setState(() {
  loadinglist = false;
});


  }
  @override
  Widget build(BuildContext context) {
    return loadinglist ? CustomCircularProgressIndicator():
    ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: list.length,
        separatorBuilder: (context,index){
        return Padding(padding: EdgeInsets.only(bottom: 5));
        },
        itemBuilder:(context,index){
        final item = list[index];
        return ListTile(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          tileColor: index.isEven?Colors.grey[300]:Colors.grey[200],
          title:Text(item.dUEDATE??''),
          subtitle: Text('BALANCE  : ${item.bALANCE}'),

        );
        });
  }
}
