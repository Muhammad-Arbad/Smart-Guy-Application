import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_guy/utils/providers.dart';

import 'package:provider/provider.dart';
import 'package:smart_guy/utils/shared_preferences.dart';
import 'package:smart_guy/views/splash_screen.dart';

import 'constants/consts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.init();
  runApp(
    ChangeNotifierProvider(
      create: (_) => OurProviderClass(),
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],

    );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black.withValues(alpha: 0.002),
    ));


    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        splashColor: Colors.transparent,
        fontFamily: "Figtree",
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF053B9D)),
        useMaterial3: true,
        // appBarTheme: AppBarTheme(
        //   backgroundColor: isDark ? CustomAppColors.blackColor.withValues(alpha: 0.8) : CustomAppColors.whiteColor.withValues(alpha: 0.8),
        // ),
        // drawerTheme: DrawerThemeData(
        //   backgroundColor: isDark ? CustomAppColors.darkScaffoldColor : CustomAppColors.darkScaffoldSecondColor,
        // ),
        //
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   backgroundColor:isDark ? CustomAppColors.blackColor.withValues(alpha: 0.8) : CustomAppColors.whiteColor,
        // ),
        //
        // scaffoldBackgroundColor: isDark ? CustomAppColors.darkScaffoldColor : CustomAppColors.lightScaffoldColor,
        //
        // textSelectionTheme: TextSelectionThemeData(
        //     selectionHandleColor: CustomAppColors.primaryColor
        // ),
      ),
      home: SplashScreen(),
      // home:Abc(),
    );
  }
}
