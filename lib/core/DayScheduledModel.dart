

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


  static List<DayScheduledModel> generateDays() => [
    DayScheduledModel(number: '6', name: 'Monday', monthName: 'January', date: DateTime(2025, 1, 6), programs: ProgramModel.generatePrograms()),
    DayScheduledModel(number: '7', name: 'Tuesday', monthName: 'January', date: DateTime(2025, 1, 7), programs: ProgramModel.generatePrograms()),
    DayScheduledModel(number: '8', name: 'Wednesday', monthName: 'January', date: DateTime(2025, 1, 8), programs: ProgramModel.generatePrograms()),
  ];

}

class ProgramModel {
  String title;
  String image;
  String time;
  
  ProgramModel({
    required this.title,
    required this.image,
    required this.time,
  });

  static List<ProgramModel> generatePrograms() => [
    ProgramModel(
        title: 'Doors Open', 
        time: '6:00 PM',
        image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg'
    ),
    ProgramModel(
        title: 'Session 1',
        time: '7:00 PM',
        image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg'
    ),
    ProgramModel(
        title: 'Session 2',
        time: '8:00 PM',
        image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg'
    ),
  ];
}




