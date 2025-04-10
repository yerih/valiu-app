import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/atomics/BlurredBackground.dart';
import 'package:valiu_app/presentation/styles/StyleText.dart';

import '../organims/CustomDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: drawer,//CustomDrawer(),
        body: Builder(
          builder: (BuildContext context) {
            return BlurredBackground(
              imagePath: 'assets/images/img.png',
              child: SizedBox.expand(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Center', style: textDrawerItem),
                    Text('Center', style: textDrawerItem),
                    ElevatedButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Text('Open Drawer'),
                    ),
                  ],
                )
              )
            );

          }
        ),
      )
    );
  }
}
