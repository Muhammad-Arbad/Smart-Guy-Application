import 'package:flutter/material.dart';
import 'package:smart_guy/constants/consts.dart';

class customChatboxoptions extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final Function(String)? onItemSelected;

  const customChatboxoptions({
    super.key,
    required this.items,
    this.selectedItem,
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 6.0,
        children: List.generate(items.length, (index) {
          final isSelected = selectedItem == items[index];

          return GestureDetector(
            onTap: () => onItemSelected?.call(items[index]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? CustomAppColors.chatoptionbg
                    : CustomAppColors.whiteColor,
                borderRadius: BorderRadius.circular(25),
                border: isSelected
                    ? Border.all(color:CustomAppColors.chatoptionbg)
                    : Border.all(color: CustomAppColors.primaryColor),
              ),
              child: Text(
                items[index],
                style: CustomTextStyles.chatboxoption.copyWith(
                  color: isSelected
                      ? CustomAppColors.primaryColor
                      : CustomTextStyles.chatboxoption.color,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
