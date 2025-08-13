import 'package:flutter/material.dart';

import 'image_icon.dart';
class ButtonIcon extends StatelessWidget {
 final String path;
 final VoidCallback onPressed;
 final Color? color;
 const ButtonIcon({super.key,required this.path,required this.onPressed,this.color});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      splashRadius: 20,
      onPressed:onPressed, icon: IconImage(path:path ),);
  }
}
