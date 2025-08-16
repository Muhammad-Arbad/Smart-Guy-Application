import 'package:flutter/material.dart';
import 'package:smart_guy/widgets/custom_avatar.dart';
import 'package:smart_guy/widgets/image_icon.dart';
import '../constants/consts.dart';

class CustomDrawer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const CustomDrawer({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.6,
      backgroundColor: Colors.black.withOpacity(0.89),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 50),
              CustomAvatar(radius: 35, iconSize: 10),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                  itemCount: AppNavigationItems.items.length,
                  itemExtent: 45,
                  itemBuilder: (context, index) {
                    final item = AppNavigationItems.items[index];


                    return

             InkWell(
                          borderRadius: BorderRadius.circular(25),
                          highlightColor: CustomAppColors.primaryColor.withOpacity(0.2),
                          splashColor: CustomAppColors.bodyColor.withOpacity(0.3),
                          // hoverColor: Colors.red.withOpacity(0.1),
                          onTap: () {
                            onItemSelected(index);
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(

                              children: [
                                IconImage(
                                  path: item.iconPath,
                                  color: Colors.white,
                                ),
                                 SizedBox(width:30),
                                Expanded(
                                  child: Text(
                                    item.label,
                                    style: CustomTextStyles.white16,
                                    textAlign: TextAlign.center,

                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                  },
                ),
              ),
            ],
          ),
        ),

    );
  }
}
