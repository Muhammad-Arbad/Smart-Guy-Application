import 'package:flutter/material.dart';
import 'package:smart_guy/widgets/greeting_text_col.dart';

import '../models/grid_item.dart';
import '../widgets/grid_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<GridItem> _gridItems = [
    GridItem(title: 'Personal/Spiritual', image: "assets/images/brain.png"),
    GridItem(title: 'Health/Wellness', image: "assets/images/heart.png"),
    GridItem(title: 'Relationships', image: "assets/images/people.png"),
    GridItem(title: 'Career', image: "assets/images/bag.png"),
    GridItem(title: 'Life Skills', image: "assets/images/book.png"),
    GridItem(title: 'Legends', image: "assets/images/web.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GreetingTextColumn(isDashboard: true),
        Expanded(
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio:2.5,
            ),
            itemCount: _gridItems.length,
            itemBuilder: (context, index) {
              final item = _gridItems[index];
              return GridCard(title:item.title,imagePath: item.image);
            },
          ),
        ),
      ],
    );
  }
}
