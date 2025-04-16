import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';

class UpdatesScreen extends StatefulWidget {
  const UpdatesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Updates'),
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
