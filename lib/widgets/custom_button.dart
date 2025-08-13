import 'package:flutter/material.dart';
import 'package:smart_guy/constants/consts.dart';

class CustomButtonWithWithoutIcon extends StatelessWidget {
  final String text;
  final String? imagePath;
  final double? width;
  final Color? bgColor;
  final Color? textColor;
  final Color? rippleColor; // For pressed state
  final Color? splashColor; // For hover/focus states
  final VoidCallback onPressed;

  const CustomButtonWithWithoutIcon({
    super.key,
    required this.onPressed,
    required this.text,
    this.imagePath,
    this.width,
    this.bgColor,
    this.textColor,
    this.rippleColor,
    this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(
              bgColor ?? CustomAppColors.primaryColor),
          fixedSize: MaterialStateProperty.all(
              Size(width ?? MediaQuery.sizeOf(context).width, 50)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return rippleColor ?? Colors.grey.withOpacity(0.2);
            }
            if (states.contains(MaterialState.hovered) ||
                states.contains(MaterialState.focused)) {
              return splashColor ?? CustomAppColors.primaryColor;
            }
            return null;
          }),
        ),
        onPressed: onPressed,
        child: imagePath != null
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath!, height: 24, width: 24),
            const SizedBox(width: 20),
            Text(
              text,
              style: CustomTextSytles.white16.copyWith(
                fontWeight: FontWeight.w600,
                color: textColor ?? Colors.black,
              ),
            ),
          ],
        )
            : Text(
          text,
          style: CustomTextSytles.white16.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}