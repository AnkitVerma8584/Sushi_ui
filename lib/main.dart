import 'package:flutter/material.dart';
import 'package:sushi_ui/models/cart.dart';
import 'package:sushi_ui/theme/colors.dart';
import 'package:sushi_ui/theme/my_theme.dart';
import 'package:provider/provider.dart';
import 'pages/intro/intro_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<MyThemeManager>(create: (_) => MyThemeManager()),
    ChangeNotifierProvider<SushiCart>(create: (_) => SushiCart())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeManager>(builder: (_, value, __) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SushiMoshai',
        home: const IntroPage(),
        themeMode: value.themeMode,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      );
    });
  }
}
