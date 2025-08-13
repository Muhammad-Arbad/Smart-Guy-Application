import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_guy/constants/consts.dart';

class ScaffoldFirst extends StatefulWidget {
 final Widget mainBody;
 const  ScaffoldFirst({super.key, required this.mainBody});

  @override
  State<ScaffoldFirst> createState() => _ScaffoldFirstState();
}

class _ScaffoldFirstState extends State<ScaffoldFirst> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Check if keyboard is visible
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: CustomAppColors.whiteColor,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.35,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  CustomAppColors.bglinear,
                  CustomAppColors.whiteColor
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: MediaQuery.sizeOf(context).height / 11.05),
                  Expanded(child: widget.mainBody),
                  // Only show RichText when keyboard is not visible
                  if (!isKeyboardVisible)
                   Padding(padding: EdgeInsets.only(bottom: 20),
                   child:  Align(
                     alignment: Alignment.center,
                     child: RichText(
                       textAlign: TextAlign.center,
                       text: TextSpan(
                         style: CustomTextSytles.grey12manrope.copyWith(height: 1.5),
                         children: [
                           TextSpan(text: "By continuing, you agree to our\n "),
                           TextSpan(
                             text: "User Agreement",
                             style: CustomTextSytles.grey12manrope.copyWith(
                               color: Colors.black,
                             ),
                           ),
                           TextSpan(text: " and "),
                           TextSpan(
                             text: "Privacy Policy",
                             style: CustomTextSytles.grey12manrope.copyWith(
                               color: Colors.black,
                             ),
                           ),
                           TextSpan(text: "."),
                         ],
                       ),
                     ),
                   ),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}