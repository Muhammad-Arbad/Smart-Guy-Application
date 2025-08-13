import 'package:flutter/material.dart';
import 'package:smart_guy/constants/consts.dart';


class GreetingTextColumn extends StatelessWidget {
  final bool? isDashboard;
  const GreetingTextColumn({super.key, this.isDashboard = false});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hey, Welcome Back   👋 ",
            style: CustomTextSytles.pagetitle

          ),
          const SizedBox(height: 4),
          Text(
            "Get Smart. Become Unstoppable!",
            style: CustomTextSytles.primaryfont18,

          ),

          if (isDashboard == true) ...[
            const SizedBox(height:10),
            Text(
                "Which area would you like to explore today?",
                style: CustomTextSytles.greytextfont14.copyWith(
                    fontWeight: FontWeight.w700
                )

            ),
          ],

          const SizedBox(height:10),
        ],
      );

  }
}
