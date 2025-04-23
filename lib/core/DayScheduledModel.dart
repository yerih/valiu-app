

class DayScheduledModel {

  String number;
  String name;
  DateTime date;
  List<ProgramModel> programs;

  DayScheduledModel({
    required this.number,
    required this.name,
    required this.date,
    this.programs = const [],
  });


  static List<DayScheduledModel> generateDays() => [
    DayScheduledModel(number: '6', name: 'Mon', date: DateTime(2024), programs: ProgramModel.generatePrograms()),
    DayScheduledModel(number: '7', name: 'Tue', date: DateTime(2025), programs: ProgramModel.generatePrograms()),
    DayScheduledModel(number: '8', name: 'Wed', date: DateTime(2026), programs: ProgramModel.generatePrograms()),
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
        time: '7:00 PM', 
        image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg'
    ),
  ];
}




