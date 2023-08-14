import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sushi_ui/models/cart.dart';
import 'package:sushi_ui/pages/home/widgets/sushi_list.dart';
import 'package:sushi_ui/pages/home/widgets/sushi_tabbar.dart';
import 'package:sushi_ui/theme/constants.dart';
import 'package:sushi_ui/theme/my_theme.dart';
import 'widgets/home_banner.dart';
import 'package:provider/provider.dart';
import 'package:sushi_ui/pages/home/navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    Color onPrimary = Theme.of(context).colorScheme.onPrimary;
    return SafeArea(
        child: Stack(children: [
      // DRAWER PAGE
      MyNavigationDrawer(onPrimary: onPrimary),
      // HOME PAGE
      TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: value),
          duration: const Duration(milliseconds: 500),
          builder: (_, double v, __) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..setEntry(0, 3, 200 * v)
                ..rotateY((pi / 6) * v),
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    details.delta.dx > 0 ? value = 1 : value = 0;
                  });
                },
                child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      leading: IconButton(
                        onPressed: () => setState(() {
                          value == 0 ? value = 1 : value = 0;
                        }),
                        icon: AnimatedCrossFade(
                            firstChild: const Icon(Icons.menu),
                            secondChild: const Icon(Icons.arrow_back),
                            crossFadeState: value == 0
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 500)),
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
                            onPressed: () => Provider.of<MyThemeManager>(
                                    context,
                                    listen: false)
                                .toggleTheme(),
                            icon: Consumer<MyThemeManager>(
                              builder: (_, val, __) => AnimatedCrossFade(
                                  firstChild: Image.asset(moonImage),
                                  secondChild: Image.asset(sunImage),
                                  crossFadeState:
                                      val.themeMode == ThemeMode.light
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
                    body: const HomePageContent()),
              ),
            );
          })
    ]));
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
      child: Column(
        children: [
          const HomeBanner(),
          const SizedBox(
            height: 18,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(16)),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search here",
                    prefixIcon: Icon(CupertinoIcons.search)),
              )),
          const SizedBox(height: 18),
          const SizedBox(height: 50, child: SushiTabBar()),
          const SizedBox(height: 18),
          const SushiList(),
          const Cart()
        ],
      ),
    );
  }
}

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SushiCart>(builder: (context, value, child) {
      return Container(
        padding: const EdgeInsets.all(10),
        height: value.myCart.isNotEmpty ? 80 : 0,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                CupertinoIcons.cart,
                color: getmyColors(context).onPrimary,
              ),
            ),
            ...List.generate(
              value.myCart.length,
              (index) => Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(5),
                child: Hero(
                  tag: "cartTag_${value.myCart[index].id}",
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(value.myCart[index].itemImage),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Text("${value.myCart.length}"),
            )
          ],
        ),
      );
    });
  }
}
