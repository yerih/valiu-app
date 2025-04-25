


import 'package:flutter/material.dart';
import 'package:valiu_app/core/DayScheduledModel.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../molecules/ProgramListTile.dart';

class ScheduleListTile extends StatelessWidget {
  final DayScheduledModel _day;
  final GlobalKey? _keyId;
  final Function(VisibilityInfo info) _onVisibilityChanged;

  const ScheduleListTile({super.key, required DayScheduledModel day, GlobalKey<State<StatefulWidget>>? keyId, required dynamic Function(VisibilityInfo) onVisibilityChanged}) : _keyId = keyId, _day = day, _onVisibilityChanged = onVisibilityChanged;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _keyId ?? GlobalKey(),
      onVisibilityChanged: _onVisibilityChanged,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text('${_day.name}, ${_day.monthName.substring(0,3)} ${_day.number}', style: TextStyle(fontWeight: FontWeight.bold))
          ),
      
          ..._day.programs.map((program) => ProgramListTile(program: program))
        ],
      ),
    );
  }
}

