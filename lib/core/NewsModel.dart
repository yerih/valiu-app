


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class NewsModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String image;
  final String createdBy;
  final List<CommentModel> comments;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.image,
    required this.createdBy,
    required this.comments,
  });

  // Factory to create single NewsModel from map
  factory NewsModel.fromMap(Map<dynamic, dynamic> map) {
    return NewsModel(
      id: map['id']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      description: map['description']?.toString() ?? '',
      date: DateTime.parse(map['date'].toString()),
      image: map['image']?.toString() ?? '',
      createdBy: map['created_by']?.toString() ?? '',
      comments: CommentModel.listFromJson(map['comments'] as List<dynamic>?),
    );
  }

  // Factory to create List<NewsModel> from JSON
  static List<NewsModel> listFromJson(List<dynamic>? json) {
    return json?.map((item) => NewsModel.fromMap(item as Map<dynamic, dynamic>)).toList() ?? [];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'image': image,
      'created_by': createdBy,
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  @override
  String toString() {
    return 'NewsModel{id: $id, title: $title, description: $description, date: $date, image: $image, createdBy: $createdBy, comments: $comments}';
  }
}

class CommentModel {
  final String user;
  final String text;

  CommentModel({required this.user, required this.text});

  factory CommentModel.fromMap(Map<dynamic, dynamic> map) {
    return CommentModel(
      user: map['user']?.toString() ?? '',
      text: map['text']?.toString() ?? '',
    );
  }

  // Factory to create List<Comment> from JSON
  static List<CommentModel> listFromJson(List<dynamic>? json) {
    return json?.map((item) => CommentModel.fromMap(item as Map<dynamic, dynamic>)).toList() ?? [];
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'text': text,
    };
  }
}