import 'package:sushi_ui/theme/constants.dart';

class SushiCategory {
  final String sushiName, sushiImage;

  SushiCategory(this.sushiName, this.sushiImage);
}

List<SushiCategory> sushis = [
  SushiCategory("Sushi", sushiImage),
  SushiCategory("Ramen", noodlesImage),
  SushiCategory("Rice", sushi1Image),
  SushiCategory("Biscuit", shrimpImage)
];
