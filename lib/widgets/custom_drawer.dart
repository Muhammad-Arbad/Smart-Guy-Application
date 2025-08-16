import 'package:flutter/material.dart';
import 'package:smart_guy/widgets/custom_avatar.dart';
import 'package:smart_guy/widgets/image_icon.dart';
import '../constants/consts.dart';

class CustomDrawer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;
  // final VoidCallback onLogout;

  const CustomDrawer({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
    // required this.onLogout,
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
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: AppNavigationItems.items.length,
                itemExtent: 45,
                itemBuilder: (context, index) {
                  final item = AppNavigationItems.items[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(25),
                    highlightColor: CustomAppColors.primaryColor.withOpacity(0.2),
                    splashColor: CustomAppColors.bodyColor.withOpacity(0.3),
                    onTap: () {
                      onItemSelected(index);
                      Navigator.pop(context);
                    },
                    child:Row(
                      children: [
                        const SizedBox(width: 8), // minimal spacing instead of big padding
                        IconImage(
                          path: item.iconPath,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            item.label,
                            style: CustomTextStyles.white16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            InkWell(
              borderRadius: BorderRadius.circular(25),
              highlightColor: CustomAppColors.primaryColor.withOpacity(0.2),
              splashColor: CustomAppColors.bodyColor.withOpacity(0.3),
              onTap: () {
                Navigator.pop(context); // close drawer

              },
              child: Padding(
                padding: const EdgeInsets.all(12,),
                child: Row(
                  children: [
                    IconImage(
                      path:"assets/images/logout.png",
                      color: Colors.white,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        "Logout",
                        style: CustomTextStyles.white16
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
