import 'package:flutter/material.dart';
import 'package:smart_guy/constants/consts.dart';

import 'package:smart_guy/widgets/image_icon.dart';

class CustomBottomNavBar extends StatefulWidget {
final int index;
final Function(int index) ontap;
CustomBottomNavBar({super.key,required this.index,required this.ontap});

  @override
  State<CustomBottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      backgroundColor: CustomAppColors.whiteColor,
      selectedItemColor: CustomAppColors.primaryColor,
      type: BottomNavigationBarType.fixed,
      iconSize: 24,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: widget.index,
      onTap:(index)=> widget.ontap(index),
      items:  AppNavigationItems.items.map((item) {
        return BottomNavigationBarItem(
          icon:  IconImage(path: item.iconPath,),
          activeIcon: IconImage(path: item.activeIconPath),
          label: '',
        );
      }).toList(),
    );
  }
}
