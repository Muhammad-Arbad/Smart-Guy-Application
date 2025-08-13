import 'package:flutter/material.dart';
class IconImage extends StatelessWidget {
 final String path;
 final Color? color;
 const IconImage({super.key,required this.path,this.color});

  @override
  Widget build(BuildContext context) {
    return ImageIcon(AssetImage(path),color: color);
  }
}
