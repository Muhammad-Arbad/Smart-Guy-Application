import 'package:flutter/material.dart';
import 'package:smart_guy/constants/consts.dart';



import 'package:smart_guy/views/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        //

        splashColor: Colors.transparent,



        colorScheme: ColorScheme.fromSeed(seedColor:Color(0xFF053B9D)),


        useMaterial3: true,
      ),
      home:SplashScreen(),
      // home:Abc(),
    );
  }
}
