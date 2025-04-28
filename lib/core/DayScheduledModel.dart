

import 'package:flutter/cupertino.dart';
import 'package:valiu_app/core/extensions.dart';

import 'ProgramModel.dart';

class DayScheduledModel {

  final String number;
  final String name;
  final DateTime date;
  final String monthName;
  List<ProgramModel> programs;

  DayScheduledModel({
    this.number = 'day number',
    this.name = 'day name',
    this.monthName = 'month name',
    required this.date,
    this.programs = const [],
  });


  static List<DayScheduledModel> generateDays() =>
      [
        DayScheduledModel(number: '6',
            name: 'Monday',
            monthName: 'January',
            date: DateTime(2025, 1, 6),
            programs: ProgramModel.generatePrograms()),
        DayScheduledModel(number: '7',
            name: 'Tuesday',
            monthName: 'January',
            date: DateTime(2025, 1, 7),
            programs: ProgramModel.generateProgramsB()),
        DayScheduledModel(number: '8',
            name: 'Wednesday',
            monthName: 'January',
            date: DateTime(2025, 1, 8),
            programs: ProgramModel.generatePrograms()),
      ];

  @override
  String toString() =>
      'DayScheduledModel{date: $date, programs: $programs}';
      // 'DayScheduledModel{number: $number, name: $name, date: $date, monthName: $monthName, programs: $programs}';


  factory DayScheduledModel.fromMap(Map<dynamic, dynamic> map) => DayScheduledModel(
      date: DateTime.parse(map['date'].toString()),
      monthName: DateTime.parse(map['date'].toString()).formatTo(format: 'MMMM'),
      name: DateTime.parse(map['date'].toString()).formatTo(format: 'EEE'),
      number: DateTime.parse(map['date'].toString()).day.toString(),
      programs: ProgramModel.listFromJson(DateTime.parse(map['date'].toString()), map['program'] as List<dynamic>?),
  );

  static List<DayScheduledModel> listFromJson(List<dynamic>? json) {
    return json?.map((item) => DayScheduledModel.fromMap(item as Map<dynamic, dynamic>)).toList() ?? [];
  }

}
