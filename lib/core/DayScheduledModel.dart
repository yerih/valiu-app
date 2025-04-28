

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

}
