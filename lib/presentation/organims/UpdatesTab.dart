


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:valiu_app/core/NewsModel.dart';
import 'package:valiu_app/core/extensions.dart';
import 'package:valiu_app/data/datasources/firebase_database_service.dart';

import '../molecules/NewsListTile.dart';
import '../navigation/Navigation.dart';

class UpdatesTab extends StatefulWidget {
  const UpdatesTab({super.key});

  @override
  State<StatefulWidget> createState() => _UpdatesSocialScreenState();
}

class _UpdatesSocialScreenState extends State<UpdatesTab> {
  final List<String> items = List.generate(10, (index) => 'Item $index');
  List<NewsModel> news = [];

  @override
  void initState() {
    super.initState();
    FirebaseRealTimeDB.getNews().then((value) {
      setState(() {news = value;});
      // debugPrint('news: $news');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage('assets/images/home_bg.jpg'),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(150),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('News', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                    Text(DateTime.now().formattedDate(), style: TextStyle(color: Colors.white, fontSize: 12, height: 2),),
                  ]
                )
              ),
            ],
          ),
          ...news.map((newItem) =>
              ListTile(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.details, arguments: newItem),
                  title: NewsListTile(date: newItem.date, title: newItem.title),
              ),
          )
        ]
      ),
    );

  }

}





