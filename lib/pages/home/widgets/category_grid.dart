import 'package:flutter/material.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (c, i) {
              return const ListTile(title: Text("Hello"));
            }));
  }
}
