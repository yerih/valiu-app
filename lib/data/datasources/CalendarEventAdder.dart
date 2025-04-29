
// import 'package:add_2_calendar/add_2_calendar.dart';
// import 'package:valiu_app/core/ProgramModel.dart';

// void addEventToCalendar(ProgramModel program) async {
//   final appName = 'Valiu App';
//   final Event event = Event(
//     title: '$appName: ${program.title}',
//     description: 'Remember to bring water!',
//     location: 'Online',
//     startDate: program.date.add(Duration(days: 1)),
//     endDate: program.date.add(Duration(days: 1, hours: 2)),
//     iosParams: IOSParams(reminder: Duration(hours: 1)),
//     androidParams: AndroidParams(emailInvites: []),
//   );
//   Add2Calendar.addEvent2Cal(event);
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../core/ProgramModel.dart';

class CalendarHelper {
  static const MethodChannel _channel = MethodChannel('com.example.calendar/event');

  static Future<void> addEventToCalendar(ProgramModel program) async {
    final DateTime eventTime = program.date;
    String eventTitle = program.title;
    try {
      await _channel.invokeMethod('addEvent', {
        'eventTime': eventTime.toIso8601String(),
        'eventTitle': eventTitle,
      });
    } on PlatformException catch (e) {
      debugPrint("addEventToCalendar:Failed to add event: ${e.message}");
    }
  }
}


