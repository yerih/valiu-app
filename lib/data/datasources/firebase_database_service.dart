
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import '../../core/NewsModel.dart';

class FirebaseRealTimeDB {

  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  // Future<void> readData() async {
  //   final ref = _database.ref();
  //   final snapshot = await ref.get();
  //   final data = snapshot.value;
  //   debugPrint('real time database: $data');
  // }

  static Future<void> readData() async {

    // final ref = _database.ref('news');
    // final snapshot = await ref.once();
    // final data = snapshot.snapshot.value;
    // final List<NewsModel?> out = data.map((e) => NewsModel.fromJson(e)).toList();
    // final list = data as List<Object?>;
    // final out = list.first
    // debugPrint('real time database: ${data.runtimeType}');
    // debugPrint('real time database: ${data}');
    // debugPrint('real time database: ${out}');

    // NewsModel.fromJsonList(snapshot);

    // final snapshot = await ref.get();
    // final data = snapshot.value;
    // NewsModel.fromSnapshot(snapshot);
    // NewsModel.fromJson(data)
    // debugPrint('real time database: $data');
  }

  static Future<List> getNews() async {
    try {
      final snapshot = await _database.ref('news').get();
      if (snapshot.exists) {
        final data = snapshot.value as List<dynamic>;
        return data
            .map((item) => NewsModel.fromMap(Map<String, dynamic>.from(item)))
            .toList()
            .cast<NewsModel>();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }

}


