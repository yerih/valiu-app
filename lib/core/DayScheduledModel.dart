

class DayScheduledModel {

  String number;
  String name;

  DayScheduledModel({
    required this.number,
    required this.name,
  });


  static List<DayScheduledModel> generateDays = [
    DayScheduledModel(number: '06', name: 'Monday'),
    DayScheduledModel(number: '07', name: 'Tuesday'),
    DayScheduledModel(number: '08', name: 'Wednesday'),
  ];

}




