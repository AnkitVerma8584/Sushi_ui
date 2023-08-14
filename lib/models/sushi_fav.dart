import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Sushi with ChangeNotifier {
  final int id;
  final String itemName, itemImage;
  final String itemDescription;
  final double price, rating;

  Sushi(
      {required this.id,
      required this.itemName,
      required this.itemImage,
      required this.itemDescription,
      required this.price,
      required this.rating});

  HashMap<int, Sushi> mySushis = HashMap();

  List<Sushi> favSushis() {
    return mySushis.entries.map((entry) => entry.value).toList();
  }

  void addOrRemoveFromFavourite(Sushi sushi) {
    if (mySushis.containsKey(sushi.id)) {
      mySushis.remove(sushi);
    } else {
      mySushis[sushi.id] = sushi;
    }
    notifyListeners();
  }
}

List<Sushi> dummySushis = [
  Sushi(
      id: 1,
      itemName: "Fake Sushi",
      itemImage: "assets/images/sushi_red.png",
      itemDescription: "",
      price: 505.5,
      rating: 4.2),
  Sushi(
      id: 2,
      itemName: "Original Sushi",
      itemImage: "assets/images/many_sushi.png",
      itemDescription: "",
      price: 55.5,
      rating: 4.5),
  Sushi(
      id: 3,
      itemName: "Ramen Sushi",
      itemImage: "assets/images/sushi.png",
      itemDescription: "",
      price: 55.5,
      rating: 4.5),
  Sushi(
      id: 4,
      itemName: "Naruto ramen",
      itemImage: "assets/images/sushi_rolls.png",
      itemDescription: "",
      price: 505.5,
      rating: 4.2),
  Sushi(
      id: 5,
      itemName: "Original Sushi",
      itemImage: "assets/images/sushi_balls.png",
      itemDescription: "",
      price: 55.5,
      rating: 4.5),
];
