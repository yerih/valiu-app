import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Resources'),
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
