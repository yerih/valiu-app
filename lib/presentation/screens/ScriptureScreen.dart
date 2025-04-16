import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';

class ScriptureScreen extends StatefulWidget {
  const ScriptureScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ScriptureScreenState();
}

class _ScriptureScreenState extends State<ScriptureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Scripture'),
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
