import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Maps'),
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
