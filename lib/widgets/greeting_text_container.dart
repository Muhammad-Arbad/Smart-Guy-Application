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
            ConstStrings.hyUser,
            style: CustomTextStyles.pagetitle16Bold700

          ),
          const SizedBox(height: 4),
          Text(
            ConstStrings.smartIntro,
            style: CustomTextStyles.subtitle20primaryw700,

          ),

          if (isDashboard == true) ...[
            const SizedBox(height:10),
            Text(
                "Which area would you like to explore today?",
                style: CustomTextStyles.pagetitle16Bold700.copyWith(
                  color: CustomAppColors.greyColor
                )

            ),
          ],

          const SizedBox(height:10),
        ],
      );

  }
}
