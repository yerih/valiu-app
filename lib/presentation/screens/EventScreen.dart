import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<StatefulWidget> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Event info'),
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
