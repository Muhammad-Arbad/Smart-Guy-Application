import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_guy/models/nav_icons.dart';
import 'package:smart_guy/views/bookmark.dart';
import 'package:smart_guy/views/dashboard.dart';
import 'package:smart_guy/views/notifications.dart';
import 'package:smart_guy/views/profile.dart';
import 'package:smart_guy/views/chat.dart';
class ConstStrings{
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

class CustomTextSytles {
  static TextStyle title = GoogleFonts.figtree(
    textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black),
  );
  static TextStyle pagetitle = GoogleFonts.figtree(
    textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black),
  );

  static TextStyle grey12manrope = GoogleFonts.manrope(
    textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.grey),
  );
  static TextStyle white16 = GoogleFonts.raleway(
    textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        overflow: TextOverflow.ellipsis,
        color: Colors.white),
  );
  static TextStyle black28 = GoogleFonts.figtree(
    textStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.black),
  );
  static TextStyle textlfieldlabeltext = GoogleFonts.figtree(
    textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: CustomAppColors.textlabelColor),
  );
  static TextStyle greytitlefont20 = GoogleFonts.figtree(
    textStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: CustomAppColors.greyColor
    ),
  );
  static TextStyle greytextfont14 = GoogleFonts.figtree(
    textStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: CustomAppColors.greyColor
    ),
  );
  static TextStyle primaryfont18 = GoogleFonts.figtree(
    textStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        color: CustomAppColors.primaryColor
    ),
  );
  static TextStyle griditemfont = GoogleFonts.figtree(
    textStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        color: CustomAppColors.greyColor
    ),
  );
  static TextStyle chatboxtext = GoogleFonts.figtree(
    textStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: CustomAppColors.greyColor
    ),
  );
  static TextStyle chatboxoption = GoogleFonts.figtree(
    textStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: CustomAppColors.primaryColor
    ),
  );
  static TextStyle expansiontitle = GoogleFonts.figtree(
    textStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: CustomAppColors.greyColor
    ),
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
