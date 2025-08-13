import 'package:flutter/material.dart';
import 'package:smart_guy/widgets/circular_iconBtn.dart';

import 'package:smart_guy/widgets/image_icon.dart';


class AppBarData {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Function(int) onBackPress;

  AppBarData({required this.scaffoldKey, required this.onBackPress});

  List<Widget?> getLeadingWidgets() {
    return [
      // ------------- For DashBoard 
            
      CircularIconBtn(scaffoldKey: scaffoldKey),
      // ------------- For Chat \
      IconButton(
        splashRadius: 20,
        onPressed: ()=> onBackPress(0), icon: IconImage(path:'assets/images/back_arrow.png' ),),
      IconButton(
        splashRadius: 20,
        onPressed: ()=> onBackPress(0), icon: IconImage(path:'assets/images/back_arrow.png' ),),
      IconButton(
        splashRadius: 20,
        onPressed: ()=> onBackPress(0), icon: IconImage(path:'assets/images/back_arrow.png' ),),


    ];
  }

  final List<List<Widget>?> appBarActions = [
    [
      Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFFF7FAFC),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset('assets/images/notification.png'),
          ),
        ),
      ),
    ],
    null,
    null,
    null,

  ];

  final List<String> appBarTitles = ['', 'Chat', 'Bookmarked', 'Profile',];
}
