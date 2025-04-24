


import 'package:flutter/material.dart';
import 'package:valiu_app/core/DayScheduledModel.dart';

import '../molecules/ProgramListTile.dart';

class ScheduleListTile extends StatelessWidget {
  final DayScheduledModel day;
  final GlobalKey? keyId;

  const ScheduleListTile({super.key, required this.day, this.keyId});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text('${day.name}, ${day.monthName.substring(0,3)} ${day.number}', style: TextStyle(fontWeight: FontWeight.bold))
        ),

        ...day.programs.map((program) => ProgramListTile(program: program))
      ],
    );
  }
}

