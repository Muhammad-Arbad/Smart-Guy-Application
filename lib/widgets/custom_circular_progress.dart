
import 'package:flutter/material.dart';

import '../constants/consts.dart';



class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  CircularProgressIndicator(
      color: CustomAppColors.primaryColor,
    );
  }
}
