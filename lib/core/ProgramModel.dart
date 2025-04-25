


class ProgramModel {
  String title;
  String image;
  String time;
  String link;
  DateTime date;

  ProgramModel({
    required this.title,
    required this.image,
    required this.time,
    required this.link,
    required this.date,
  });

  static List<ProgramModel> generatePrograms() => [
    ProgramModel(
        title: 'Doors Open',
        time: '6:00 PM',
        image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
        date: DateTime(2025, 1, 6),
        link: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg'
    ),
    ProgramModel(
        title: 'Session 1',
        time: '7:00 PM',
        image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
        date: DateTime(2025, 1, 7),
        link: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
    ),
    ProgramModel(
        title: 'Session 2',
        time: '8:00 PM',
        image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
        link: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
        date: DateTime(2025, 1, 8)
    ),
  ];
}








