import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/atomics/BlurredBackground.dart';

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
        body: BlurredBackground(
          imagePath: 'assets/images/img.png',
          blurSigma: 1.0,
          child: Center(
              child: Text(
                'Passion 2025',
                style: TextStyle(color: Colors.white, fontSize: 24),
              )
          ),
        ),
      ),
    );
  }
}
