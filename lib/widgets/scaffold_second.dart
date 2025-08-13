import 'package:flutter/material.dart';

import 'package:smart_guy/constants/appbar_data.dart';
import 'package:smart_guy/constants/consts.dart';

import 'package:smart_guy/widgets/bottom_nav_bar.dart';
import 'package:smart_guy/widgets/custom_drawer.dart';



class ScaffoldSecond extends StatefulWidget {
  final Widget? body;

  const ScaffoldSecond({super.key, this.body});

  @override
  State<ScaffoldSecond> createState() => _ScaffoldSecondState();
}

class _ScaffoldSecondState extends State<ScaffoldSecond> {
  static int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDrawerVisible = _currentIndex == 0; 
  late AppBarData appBarData;


  @override
  void initState() {
    super.initState();
    appBarData = AppBarData(
      scaffoldKey: _scaffoldKey,
      onBackPress: (index) => setState(() => _currentIndex = index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: CustomAppColors.bodyColor,
      //--------------------------AppBar 😊
      appBar: AppBar(
        toolbarHeight: kToolbarHeight+10,
        bottomOpacity: 0.5,
        backgroundColor: CustomAppColors.whiteColor,
        elevation: 0,

        scrolledUnderElevation: 0,
        title: Text(appBarData.appBarTitles[_currentIndex], style: CustomTextSytles.title),
        leading: appBarData.getLeadingWidgets()[_currentIndex],
        actions: appBarData.appBarActions[_currentIndex],
        centerTitle: true,
      ),
      //---------------------------Drawer😒
      
      drawer: isDrawerVisible ? CustomDrawer(
        currentIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ) : null,
      //---------------------------Body😒
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20,20,0),
        child: widget.body ?? IndexedStack(
          index: _currentIndex,
          children:AppScreens.screens,
        ),
      ),
      //---------------------------BottomNav😒
      bottomNavigationBar: CustomBottomNavBar(
        index: _currentIndex,
        ontap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
