

// import 'package:device_calendar/device_calendar.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// Future<bool> isEventAddedByApp(DateTime dateTime) async {
//   final permissionStatus = await Permission.calendar.status;
//   if (!permissionStatus.isGranted) {
//     final result = await Permission.calendar.request();
//     if (!result.isGranted) return false;
//   }
//
//   final deviceCalendarPlugin = DeviceCalendarPlugin();
//
//   try {
//     final calendarsResult = await deviceCalendarPlugin.retrieveCalendars();
//     if (!calendarsResult.isSuccess || calendarsResult.data!.isEmpty) {
//       return false;
//     }
//
//     for (final calendar in calendarsResult.data!) {
//       final eventsResult = await deviceCalendarPlugin.retrieveEvents(
//         calendar.id,
//         RetrieveEventsParams(
//           startDate: dateTime.subtract(const Duration(days: 1)),
//           endDate: dateTime.add(const Duration(days: 1)),
//         ),
//       );
//
//       if (eventsResult.isSuccess) {
//         for (final event in eventsResult.data!) {
//           if (event.start?.isAtSameMomentAs(dateTime) ?? false) {
//             return true;
//           }
//         }
//       }
//     }
//   } catch (e) {
//     debugPrint('Error checking calendar: $e');
//   }
//
//   return false;
// }
//
//
//
