

class DayScheduledModel {

  String number;
  String name;
  DateTime date;

  DayScheduledModel({
    required this.number,
    required this.name,
    required this.date,
  });


  static List<DayScheduledModel> generateDays() => [
    DayScheduledModel(number: '06', name: 'Monday', date: DateTime(2024)),
    DayScheduledModel(number: '07', name: 'Tuesday', date: DateTime(2025)),
    DayScheduledModel(number: '08', name: 'Wednesday', date: DateTime(2026)),
  ];

}




