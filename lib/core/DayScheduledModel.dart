

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
    DayScheduledModel(number: '6', name: 'Mon', date: DateTime(2024)),
    DayScheduledModel(number: '7', name: 'Tue', date: DateTime(2025)),
    DayScheduledModel(number: '8', name: 'Wed', date: DateTime(2026)),
  ];

}




