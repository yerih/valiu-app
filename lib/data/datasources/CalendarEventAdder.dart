

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:valiu_app/core/ProgramModel.dart';

void addEventToCalendar(ProgramModel program) async {
  final appName = 'Valiu App';
  final Event event = Event(
    title: '$appName: ${program.title}',
    description: 'Remember to bring water!',
    location: 'Online',
    startDate: program.date.add(Duration(days: 1)),
    endDate: program.date.add(Duration(days: 1, hours: 2)),
    iosParams: IOSParams(reminder: Duration(hours: 1)),
    androidParams: AndroidParams(emailInvites: []),
  );
  final result = await Add2Calendar.addEvent2Cal(event);
  debugPrint('result = $result');
}



