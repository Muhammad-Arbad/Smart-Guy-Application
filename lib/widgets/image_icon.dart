import 'package:flutter/material.dart';
import 'package:smart_guy/constants/consts.dart';
class IconImage extends StatelessWidget {
 final String path;
 final Color? color;
 final double? size;
 const IconImage({super.key,required this.path,this.color,this.size =24});

  @override
  Widget build(BuildContext context) {
    return ImageIcon(AssetImage(path),color: color,size:size);
  }
}
