import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/custom_circular_progress.dart';

class CustomBlurEffect extends StatelessWidget {
  final bool showLoading,isDownloading;
  const CustomBlurEffect({
    super.key,
    this.showLoading = false,
    this.isDownloading=false
  });


  final double blurEffect = 2;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurEffect, sigmaY: blurEffect),
          child: Container(
            color: Colors.transparent,
            child:
            showLoading?
            Center(child: CustomCircularProgressIndicator()):Container(),
          ),
        ),
        if(isDownloading)
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Material(
                      child: Text(
                        "Downloading...",
                        // style: CustomTextStyles
                        //     .title12PrimaryColor
                        //     .copyWith(
                        //     color: CustomAppColors.primaryColor),
                      ),
                    ),
                  ),
                ],
              ))
      ],
    );
  }
}