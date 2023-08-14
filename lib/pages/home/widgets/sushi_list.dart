import 'package:flutter/material.dart';
import 'package:sushi_ui/models/sushi_fav.dart';
import '../../../components/category_card.dart';

class SushiList extends StatefulWidget {
  const SushiList({super.key});

  @override
  State<SushiList> createState() => _SushiListState();
}

class _SushiListState extends State<SushiList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: dummySushis.length,
          itemBuilder: (context, index) =>
              CategoryCard(sushi: dummySushis[index])),
    );
  }
}
