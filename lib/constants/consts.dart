import 'package:flutter/material.dart';
import 'package:smart_guy/widgets/circular_iconBtn.dart';
import 'package:smart_guy/widgets/image_icon.dart';
import 'package:smart_guy/models/nav_icons.dart';
import 'package:smart_guy/views/bookmark.dart';
import 'package:smart_guy/views/dashboard.dart';
import 'package:smart_guy/views/profile.dart';
import 'package:smart_guy/views/chat.dart';
class ConstStrings{
  static const String figtreeFont="Figtree";
  static const String hyUser="Hey, Welcome Back   👋 ";
  static const String smartIntro ="Get Smart. Become Unstoppable!";
  static const String https = "https";
  static  String baseUrlStd = "$https://api.ekhaata.com/school/student/";
}

class CustomAppColors {
  static const Color whiteColor = Colors.white;
  static const Color bodyColor = Color(0xFFF7FAFC);
  static final Color greyColor = Color(0xFF333333);
  static const Color primaryColor = Color(0xFF053B9D);
  static const Color bglinear = Color(0XFF678CCD);
  static const Color textlabelColor = Color(0XFF776F69);
  static final Color grayBorderClr = Color(0xFFE0E0E0);
  static final Color chatoptionbg = Color(0xFFCCDEFF);
  static const Color errorBackgroundColor = Colors.red;
}

class CustomTextStyles {
  static TextStyle title18blackBold = const TextStyle(

    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle pagetitle16Bold700 = const TextStyle(
    fontFamily: "Figtree",
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle grey12manrope = const TextStyle(
    fontFamily: "Figtree",
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static TextStyle white16 = const TextStyle(
    fontFamily: "Figtree",
    fontSize: 16,
    fontWeight: FontWeight.normal,
    overflow: TextOverflow.ellipsis,
    color: Colors.white,
  );

  static TextStyle black28 = const TextStyle(
    fontFamily: "Figtree",
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle textlfieldlabeltext = TextStyle(
    fontFamily: "Figtree",
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: CustomAppColors.textlabelColor,
  );

  static TextStyle greytitlefont20 = TextStyle(
    fontFamily: "Figtree",
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.greyColor,
  );

  static TextStyle greytextfont14 = TextStyle(
    fontFamily: "Figtree",
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.greyColor,
  );

  static TextStyle subtitle20primaryw700 = TextStyle(
    fontFamily: "Figtree",
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    // fontWeight: FontWeight.w700,
    color: CustomAppColors.primaryColor,
  );

  static TextStyle card16Gryw700 = TextStyle(
    fontFamily: "Figtree",
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    color: CustomAppColors.greyColor,

  );

  static TextStyle chtboxtxt14Gry500 = TextStyle(
    fontFamily: "Figtree",
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: CustomAppColors.greyColor,
  );

  static TextStyle chatboxoption = TextStyle(
    fontFamily: "Figtree",
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: CustomAppColors.primaryColor,
  );

  static TextStyle expansiontitle = TextStyle(
    fontFamily: "Figtree",
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: CustomAppColors.greyColor,
  );
}

class AppScreens {
  static final screens = [
    const Dashboard(),
    const Chat(),
     Bookmark(),
    const Profile(),

  ];
}

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
class AppNavigationItems {
  static final List<NavigationItem> items = [
    NavigationItem(
      label: 'Home',
      iconPath: 'assets/nav_icons/dashboard.png',
      activeIconPath: 'assets/nav_icons/dashboard_active.png',
    ),
    NavigationItem(
      label: 'Chat',
      iconPath: 'assets/nav_icons/chat.png',
      activeIconPath: 'assets/nav_icons/chat_active.png',
    ),
    NavigationItem(
      label: 'Bookmark',
      iconPath: 'assets/nav_icons/bookmark.png',
      activeIconPath: 'assets/nav_icons/bookmark_active.png',
    ),
    NavigationItem(
      label: 'Profile',
      iconPath: 'assets/nav_icons/profile.png',
      activeIconPath: 'assets/nav_icons/profile_active.png',
    ),

  ];
}
