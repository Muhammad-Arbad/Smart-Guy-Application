import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final double? radius;
  final double? iconSize;
  final bool? isSideIconShown;

  const CustomAvatar({
    super.key,
    this.radius = 50,
    this.iconSize = 15,
    this.isSideIconShown = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor:Colors.transparent,
          backgroundImage: const AssetImage("assets/images/avatar.png"),
        ),
        if (isSideIconShown == true)
          Positioned(
            right: 4,
            bottom:4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,

              ),
              child: CircleAvatar(
                radius: iconSize,
                backgroundColor: Colors.transparent,
                backgroundImage: const AssetImage("assets/images/avatar_icon.png"),
              ),
            ),
          ),
      ],
    );
  }
}
