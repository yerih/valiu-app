

import 'package:device_calendar/device_calendar.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> isEventAddedByApp(DateTime dateTime) async {
  // Request calendar permissions
  final permissionStatus = await Permission.calendar.status;
  if (!permissionStatus.isGranted) {
    final result = await Permission.calendar.request();
    if (!result.isGranted) return false;
  }

  // Initialize the plugin
  final deviceCalendarPlugin = DeviceCalendarPlugin();

  try {
    // Retrieve device calendars
    final calendarsResult = await deviceCalendarPlugin.retrieveCalendars();
    if (!calendarsResult.isSuccess || calendarsResult.data!.isEmpty) {
      return false;
    }

    // Check each calendar
    for (final calendar in calendarsResult.data!) {
      // Retrieve events for the target date
      final eventsResult = await deviceCalendarPlugin.retrieveEvents(
        calendar.id,
        RetrieveEventsParams(
          startDate: dateTime.subtract(const Duration(days: 1)),
          endDate: dateTime.add(const Duration(days: 1)),
        ),
      );

      if (eventsResult.isSuccess) {
        // Check if any event matches our target date/time
        for (final event in eventsResult.data!) {
          if (event.start?.isAtSameMomentAs(dateTime) ?? false) {
            return true;
          }
        }
      }
    }
  } catch (e) {
    print('Error checking calendar: $e');
  }

  return false;
}



