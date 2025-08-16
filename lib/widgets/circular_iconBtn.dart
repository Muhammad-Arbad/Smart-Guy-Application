import 'package:flutter/material.dart';

class CircularIconBtn extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CircularIconBtn({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,

      splashRadius: 0.5,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: Container(
        margin: const EdgeInsets.only(left: 16),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color:Color(0xFFF7FAFC),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/menue.png',
            width: 24,
            height: 24,
          ),
        ),
      ),
      onPressed: () {
        if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
          scaffoldKey.currentState?.openEndDrawer();
        } else {
          scaffoldKey.currentState?.openDrawer();
        }
      },
    );
  }
}
