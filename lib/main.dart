import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_guy/utils/providers.dart';

import 'package:provider/provider.dart';
import 'package:smart_guy/views/splash_screen.dart';

void main() {
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
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

   //final isDark = Provider.of<OurProviderClass>(context).isDarkMode;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
     // statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        splashColor: Colors.transparent,
        fontFamily: "Figtree",
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF053B9D)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      // home:Abc(),
    );
  }
}
