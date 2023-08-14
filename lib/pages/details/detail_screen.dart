import 'package:flutter/material.dart';
import 'package:sushi_ui/models/cart.dart';
import 'package:sushi_ui/models/sushi_fav.dart';
import 'package:provider/provider.dart';
import '../../theme/constants.dart';
import '../../theme/my_theme.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.sushi});
  final Sushi sushi;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String cartTag = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Row(
          children: [
            Icon(Icons.location_pin),
            Text("Kolkata"),
          ],
        ),
        actions: [
          SizedBox(
            height: 40,
            width: 40,
            child: IconButton(
              onPressed: () =>
                  Provider.of<MyThemeManager>(context, listen: false)
                      .toggleTheme(),
              icon: Consumer<MyThemeManager>(
                builder: (_, val, __) => AnimatedCrossFade(
                    firstChild: Image.asset(moonImage),
                    secondChild: Image.asset(sunImage),
                    crossFadeState: val.themeMode == ThemeMode.light
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 500)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: CircleAvatar(
              child: Image.asset(sushiImage),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Hero(
              tag: cartTag + widget.sushi.id.toString(),
              child: Image.asset(widget.sushi.itemImage)),
          Text(widget.sushi.itemName),
          Text(widget.sushi.itemDescription),
          const SizedBox(height: 50),
          FilledButton(
              onPressed: () {
                setState(() {
                  cartTag = 'cartTag_';
                });
                Provider.of<SushiCart>(context, listen: false)
                    .addToCart(widget.sushi);
                Navigator.pop(context);
              },
              child: const Text("Add to cart"))
        ]),
      ),
    );
  }
}
