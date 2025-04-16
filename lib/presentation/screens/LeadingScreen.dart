import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';

class LeadingScreen extends StatefulWidget {
  const LeadingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LeadingScreenState();
}

class _LeadingScreenState extends State<LeadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Leading the way'),
      body: Center(
        child: Text(
          'Using app bar',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
