


import 'package:flutter/cupertino.dart';
import 'package:valiu_app/core/extensions.dart';

class ProgramModel {
  int id;
  String title;
  String image;
  String time;
  String link;
  DateTime date;
  bool isAdded;

  ProgramModel({
    required this.title,
    required this.image,
    required this.time,
    required this.link,
    required this.date,
    required this.id,
    this.isAdded = false,
  });

  @override
  String toString() => 'ProgramModel{title: $title, image: $image, time: $time, link: $link, date: $date, id: $id, isAdded: $isAdded}';

  factory ProgramModel.fromMap(DateTime date, Map<dynamic, dynamic> map) => ProgramModel(
      id: map['id']?.toInt() ?? 0,
      date: date,
      time: map['time']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      image: map['image']?.toString() ?? '',
      link: map['link']?.toString() ?? '',
  );


  static List<ProgramModel> listFromJson(DateTime date, List<dynamic>? json) {
    return json?.map((item) => ProgramModel.fromMap(date, item as Map<dynamic, dynamic>)).toList() ?? [];
  }

  static List<ProgramModel> generatePrograms() => [
    ProgramModel(
      title: 'Doors Open',
      time: '6:00 PM',
      image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      date: DateTime(2025, 1, 6),
      link: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      id: 1,
    ),
    ProgramModel(
      title: 'Kari Job message',
      // title: 'Session 1',
      time: '7:00 PM',
      image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      date: DateTime(2025, 1, 7),
      link: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      id: 2,
    ),
    ProgramModel(
      title: 'Fireworks',
      // title: 'Session 2',
      time: '8:00 PM',
      image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      link: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      date: DateTime(2025, 1, 8),
      id: 3,
    ),
  ];
  static List<ProgramModel> generateProgramsB() => [
    ProgramModel(
      title: 'Doors Open',
      time: '6:00 PM',
      image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      date: DateTime(2025, 1, 6),
      link: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      id: 1,
    ),
    ProgramModel(
      title: 'Cody Carnes message',
      // title: 'Session 1',
      time: '7:00 PM',
      image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      date: DateTime(2025, 1, 7),
      link: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      id: 2,
    ),
    ProgramModel(
      title: 'Final words',
      // title: 'Session 2',
      time: '8:00 PM',
      image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      link: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      date: DateTime(2025, 1, 8),
      id: 3,
    ),
  ];
  static List<ProgramModel> generateProgramsC() => [
    ProgramModel(
      title: 'Worship',
      time: '6:00 PM',
      image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      date: DateTime(2025, 1, 6),
      link: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      id: 1,
    ),
    ProgramModel(
      title: 'John Stuart message',
      // title: 'Session 1',
      time: '7:00 PM',
      image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      date: DateTime(2025, 1, 7),
      link: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      id: 2,
    ),
    ProgramModel(
      title: 'Pray',
      // title: 'Session 2',
      time: '8:00 PM',
      image: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      link: 'https://pe-assets.nyc3.cdn.digitaloceanspaces.com/images/f83c6298-6662-43cf-b2cb-f1a1a040cd32.552722.jpg',
      date: DateTime(2025, 1, 8),
      id: 3,
    ),
  ];
}








