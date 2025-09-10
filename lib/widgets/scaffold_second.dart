import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:smart_guy/constants/consts.dart';

import 'package:smart_guy/widgets/bottom_nav_bar.dart';
import 'package:smart_guy/widgets/custom_drawer.dart';

import '../utils/providers.dart';
import '../views/chat.dart';

class ScaffoldSecond extends StatefulWidget {
  final Widget? body;

  const ScaffoldSecond({super.key, this.body});

  @override
  State<ScaffoldSecond> createState() => _ScaffoldSecondState();
}

class _ScaffoldSecondState extends State<ScaffoldSecond> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // bool isDrawerVisible = Provider.of<OurProviderClass>(context, listen: false).getCurrentIndex == 0;
  late AppBarData appBarData;

  @override
  void initState() {
    super.initState();
    appBarData = AppBarData(
        scaffoldKey: _scaffoldKey,
        onBackPress: (index) => {
              log("add data $index"),
              Provider.of<OurProviderClass>(context, listen: false)
                  .changeCurrentIndex(index),
              WidgetsBinding.instance.addPostFrameCallback((_) {
                FocusManager.instance.primaryFocus?.unfocus();
              }),
            });
  }

  @override
  Widget build(BuildContext context) {
    final int currentIndex =
        Provider.of<OurProviderClass>(context, listen: true).getCurrentIndex;
    return

      Scaffold(
      key: _scaffoldKey,
      // backgroundColor: CustomAppColors.darkScaffoldSecondColor,
      backgroundColor: CustomAppColors.bodyColor,
      //--------------------------AppBar  ✔
      appBar: AppBar(
        backgroundColor: CustomAppColors.whiteColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(appBarData.appBarTitles[currentIndex],
            style: CustomTextStyles.title18blackBold),
        leading: appBarData.getLeadingWidgets()[currentIndex],
        actions: appBarData.appBarActions[currentIndex],
        centerTitle: true,
      ),
      //---------------------------Drawer  ✔

      drawer: currentIndex == 0
          ? CustomDrawer(
              currentIndex: currentIndex,
              onItemSelected: (index) {
                setState(() {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  });
                  FocusScope.of(context).unfocus();
                  // if (index == 1) {
                  //   (chatScreenKey.currentState as ChatScreenState?)
                  //       ?.resetChat();
                  // }

                  Provider.of<OurProviderClass>(context, listen: false)
                      .changeCurrentIndex(index);
                });
              },
            )
          : null,
      //---------------------------Body   ✔
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: widget.body ??
            IndexedStack(
              index: currentIndex,
              children: AppScreens.screens,
            ),
      ),
      //---------------------------BottomNav   ✔
      bottomNavigationBar: CustomBottomNavBar(
        index: Provider.of<OurProviderClass>(context, listen: false)
            .getCurrentIndex,
        ontap: (index) => {
          FocusManager.instance.primaryFocus?.unfocus(),
          Provider.of<OurProviderClass>(context, listen: false)
              .changeCurrentIndex(index),
          // if (index == 1)
          //   {
          //     (chatScreenKey.currentState as ChatScreenState?)?.resetChat(),
          //   }
        },
      ),
    );
  }
}
