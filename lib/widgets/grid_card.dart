import 'package:flutter/material.dart';
import 'package:smart_guy/constants/consts.dart';
class GridCard extends StatelessWidget {
 final String title;
 final String imagePath;
  const  GridCard({super.key,required this.title,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return

      GestureDetector(
        onTap: (){

        },
        child: Container(
         padding: EdgeInsets.only(left:8,right: 8),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imagePath, width: 24, height: 24),
              const SizedBox(width:8),
              Expanded(
                child: Text(
                  title,

                  overflow: TextOverflow.ellipsis,
                  style:CustomTextStyles.card16Gryw700,

                ),
              ),
            ],
          ),
        ),
      );



}
}
