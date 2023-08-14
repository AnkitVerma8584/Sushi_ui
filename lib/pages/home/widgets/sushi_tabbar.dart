import 'package:flutter/material.dart';
import '../../../components/category_tab.dart';
import '../../../models/sushi_category.dart';

class SushiTabBar extends StatefulWidget {
  const SushiTabBar({
    super.key,
  });

  @override
  State<SushiTabBar> createState() => _SushiTabBarState();
}

class _SushiTabBarState extends State<SushiTabBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: sushis.length,
      itemBuilder: (context, index) => GestureDetector(
          onTap: () => setState(() {
                currentIndex = index;
              }),
          child: SushiTab(
              isSelected: currentIndex == index,
              sushiName: sushis[index].sushiName,
              sushiImage: sushis[index].sushiImage)),
    );
  }
}
