import 'package:flutter/material.dart';

Future<DateTime?> launchDatePicker(
    BuildContext context,
    DateTime selectedDate,
    DateTime initDate,
    DateTime lastDate,
) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
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
            dividerColor: Colors.transparent,
            backgroundColor: Colors.white,
            headerBackgroundColor: Colors.white,
          ),
          colorScheme: ColorScheme.light(
            primary: Colors.black,        // selected date circle & header
            onPrimary: Colors.white,      // text on selected circle
            onSurface: Colors.grey.shade500,    // default text color (dates, labels)
          ),
          textTheme: TextTheme(
            headlineLarge: TextStyle(color: Colors.blue), // Month & year
            titleMedium: TextStyle(color: Colors.red),   // Days of week
            bodySmall: TextStyle(color: Colors.green),     // Dates in grid
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
          ),
        ),
        child: child!,
      );
    },
  );
  if (picked != null) {
    return picked.isBefore(initDate) ? initDate : picked.isAfter(lastDate) ? lastDate : picked;
  }
  return picked;
}





