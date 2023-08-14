import 'package:flutter/cupertino.dart';
import 'package:sushi_ui/models/sushi_fav.dart';

class SushiCart extends ChangeNotifier {
  List<Sushi> myCart = [];

  void addToCart(Sushi sushi) {
    if (!myCart.contains(sushi)) {
      myCart.add(sushi);
      notifyListeners();
    }
  }
}
