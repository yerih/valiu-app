import 'package:flutter/material.dart';

Future<DateTime?> launchDatePicker(BuildContext context, DateTime initDate, DateTime lastDate) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initDate,
    firstDate: initDate,//DateTime(2024),
    lastDate: lastDate,//DateTime(2026),
    helpText: 'Select Date', // Title text
    cancelText: 'Cancel',
    confirmText: 'Okay',
    initialEntryMode: DatePickerEntryMode.calendar, // opens in calendar view
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          datePickerTheme: DatePickerThemeData(
            // This hides the divider
            dividerColor: Colors.transparent,

            // Optional: Customize header or background if needed
            backgroundColor: Colors.white,
            headerBackgroundColor: Colors.white,
            // dayForegroundColor: MaterialStateProperty.all(Colors.black),
          ),
          colorScheme: ColorScheme.light(
            primary: Colors.black,        // selected date circle & header
            onPrimary: Colors.white,      // text on selected circle
            onSurface: Colors.grey.shade500,    // default text color (dates, labels)

            // onSurface: Colors.grey.shade500,    // default text color (dates, labels)
            // onSurface: Colors.black87,    // default text color (dates, labels)

          ),
          textTheme: TextTheme(
            headlineLarge: TextStyle(color: Colors.blue), // Month & year
            titleMedium: TextStyle(color: Colors.red),   // Days of week
            bodySmall: TextStyle(color: Colors.green),     // Dates in grid
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black, // Cancel/Okay button text
            ),
          ),
        ),
        child: child!,
      );
    },
  );
  debugPrint('selected date: $picked');
  if (picked != null) {
    return picked.isBefore(initDate) ? initDate : picked.isAfter(lastDate) ? lastDate : picked;
  }
  return picked;
}





Future<void> launchDateRangePicker(BuildContext context, DateTime initDate, DateTime lastDate) async {
  final DateTimeRange? picked = await showDateRangePicker(
    context: context,
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    currentDate: DateTime.now(),
    saveText: 'Done',
    helpText: 'Select date range',
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.blue, // Header background color
            onPrimary: Colors.white, // Header text color
            onSurface: Colors.black, // Body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue, // Button text color
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (picked != null) {
    print('Selected range: ${picked.start} to ${picked.end}');
  }
}



