import 'package:flutter/material.dart';
import 'package:smart_guy/constants/consts.dart';

class CustomChatboxavatar extends StatelessWidget {
  final String text;
  const CustomChatboxavatar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: CustomAppColors.whiteColor,
            child: Text(
                'SG',
                textAlign: TextAlign.center,
                style: CustomTextSytles.primaryfont18.copyWith(fontWeight: FontWeight.normal),
              ),

          ),
          const SizedBox(width: 6),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: CustomAppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                text,
                style: CustomTextSytles.chatboxtext,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
