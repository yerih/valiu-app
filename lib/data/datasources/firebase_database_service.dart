
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import '../../core/NewsModel.dart';

class FirebaseRealTimeDB {

  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  static Future<List<NewsModel>> getNews() async {
    try {
      final snapshot = await _database.ref('news').get();
      if (snapshot.exists && snapshot.value is List<dynamic>) {
        return NewsModel.listFromJson(snapshot.value as List<dynamic>);
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }
  //
  // static Future<List<NewsModel>> getNews() async {
  //   try {
  //     final snapshot = await _database.ref('news').get();
  //     if (snapshot.exists) {
  //       final data = snapshot.value as List<dynamic>;
  //       return data
  //           .map((item) => NewsModel.fromMap(Map<String, dynamic>.from(item)))
  //           .toList()
  //           .map((item) => item)
  //           .toList();
  //           // .cast<NewsModel>();
  //     }
  //     return [];
  //   } catch (e) {
  //     throw Exception('getNews(): $e');
  //   }
  // }

}


