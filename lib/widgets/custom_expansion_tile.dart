import 'package:flutter/material.dart';
import 'package:smart_guy/constants/consts.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final String expandedTitle;
  final EdgeInsetsGeometry? tilePadding;
  final EdgeInsetsGeometry? contentPadding;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.expandedTitle,
    this.tilePadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    this.contentPadding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,

      ),
      child: Padding(padding: EdgeInsets.fromLTRB(55, 6, 0, 6),
      child: ExpansionTile(

        backgroundColor: CustomAppColors.whiteColor,
        collapsedBackgroundColor: CustomAppColors.whiteColor,
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        childrenPadding: EdgeInsets.symmetric(horizontal: 4,vertical: 6),
        collapsedIconColor: CustomAppColors.greyColor,
        iconColor:CustomAppColors.greyColor ,
        // tilePadding: tilePadding,
        title: Text(
          title,
          style: CustomTextSytles.expansiontitle.copyWith(
              fontWeight: FontWeight.bold
          ),
        ),
        children: [
          Padding(
            padding: contentPadding!,
            child: Text(
              expandedTitle,
              style: CustomTextSytles.expansiontitle.copyWith(
                  letterSpacing: 0.3
              ), // Add this to your consts.dart
            ),
          ),
        ],
      ),)
    );
  }
}