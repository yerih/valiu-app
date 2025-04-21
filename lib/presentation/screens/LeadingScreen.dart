import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';

import '../../core/Result.dart';
import '../../data/repositories/PreachersRepository.dart';

class LeadingScreen extends StatefulWidget {
  const LeadingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LeadingScreenState();
}

class _LeadingScreenState extends State<LeadingScreen> {
  @override
  void initState() {
    super.initState();
    _getPreachers();
  }

  void _getPreachers() async {
    final result = await PreachersRepository().getPreachers();
    switch(result){
      case Result(isSuccess: true): debugPrint('isSuccess: ${result.data}');
      case Result(isError: true): debugPrint('isError: ${result.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Leading the way'),
      body: Center(
        child: InkWell(
          onTap: _getPreachers,
          child: Text(
            'get Preachers',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        )
      ),
    );
  }
}
