import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNavigationDrawer extends StatelessWidget {
  const MyNavigationDrawer({
    super.key,
    required this.onPrimary,
  });

  final Color onPrimary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView(padding: EdgeInsets.zero, children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
            radius: 30,
            child: Image.asset("assets/images/sushi_red.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Ankit Verma",
            style: TextStyle(color: onPrimary),
            textScaleFactor: 1.2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "noemail@gmail.com",
            style: TextStyle(color: onPrimary),
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.home,
            color: onPrimary,
          ),
          title: Text("Home", style: TextStyle(color: onPrimary)),
        ),
        ListTile(
          leading: Icon(CupertinoIcons.person_crop_circle, color: onPrimary),
          title: Text("Profile", style: TextStyle(color: onPrimary)),
        ),
        ListTile(
          leading: Icon(CupertinoIcons.mail, color: onPrimary),
          title: Text("Email me", style: TextStyle(color: onPrimary)),
        ),
      ]),
    );
  }
}
