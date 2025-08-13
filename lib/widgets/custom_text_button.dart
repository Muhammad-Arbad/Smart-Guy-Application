import 'package:flutter/material.dart';

import '../constants/consts.dart';
class CustomTextButton extends StatelessWidget {
 final String title;
 final VoidCallback onPressed;
 final Color? textcolor;
  const  CustomTextButton({super.key,required this.onPressed,required this.title,this.textcolor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ()=>onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
           
            if (states.contains(MaterialState.hovered)) {
              return  CustomAppColors.bodyColor.withOpacity(0.1);// Hover Color (for web/desktop)
            }
            if (states.contains(MaterialState.pressed)) {
              return  CustomAppColors.bodyColor.withOpacity(0.1);// Hover Color (for web/desktop)
            }
            return null; // Default fallback
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Rounded splash boundary
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adjust touch area
        ),
      ),
      child:  Text(
           title,
        style: TextStyle(color:textcolor),
      ),
    );
  }
}
