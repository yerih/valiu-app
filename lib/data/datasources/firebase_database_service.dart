
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:valiu_app/core/DayScheduledModel.dart';
import 'package:valiu_app/core/SocialNetworkModel.dart';
import '../../core/NewsModel.dart';
import '../../core/PreacherModel.dart';

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
      throw Exception('getNews: Failed to fetch news: $e');
    }
  }


  static Future<List<PreacherModel>> getPreachers() async {
    try {
      final snapshot = await _database.ref('preachers').get();
      if (snapshot.exists && snapshot.value is List<dynamic>) {
        return PreacherModel.listFromJson(snapshot.value as List<dynamic>);
      }
      return [];
    } catch (e) {
      throw Exception('getPreachers: Failed to fetch preachers: $e');
    }
  }


  static Future<List<SocialNetworkModel>> getSocialNetworks() async {
    try {
      final snapshot = await _database.ref('social_networks').get();
      if (snapshot.exists && snapshot.value is List<dynamic>) {
        return SocialNetworkModel.listFromJson(snapshot.value as List<dynamic>);
      }
      return [];
    } catch (e) {
      debugPrint('getSocialNetworks: Failed to fetch social networks: $e');
      return [];
    }
  }

  static Future<List<DayScheduledModel>> getSchedule() async {
    try {
      final snapshot = await _database.ref('schedule').get();
      if (snapshot.exists && snapshot.value is List<dynamic>) {
        return DayScheduledModel.listFromJson(snapshot.value as List<dynamic>);
      }
      return [];
    } catch (e) {
      debugPrint('getSchedule:Failed to fetch schedule: $e');
      return [];
    }
  }
}


