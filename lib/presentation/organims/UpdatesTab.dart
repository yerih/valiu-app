


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:valiu_app/core/NewsModel.dart';
import 'package:valiu_app/core/extensions.dart';
import 'package:valiu_app/data/datasources/firebase_database_service.dart';

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
                  onTap: () => {},
                  title: Container(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(top: BorderSide(color: Colors.black, width: 3)),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey.shade500, width: 0.5)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.solidCircleCheck, size: 16,),
                                  SizedBox(width: 10),
                                  Text(newItem.date.toDetailed(), style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
                                ],
                              ),
                              IconButton(onPressed: (){}, icon: Icon(Icons.share, size: 20,))
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(newItem.title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('- Continue reading'.toUpperCase(), style: TextStyle(fontSize: 12)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ),
          )
        ]
      ),
    );

  }

}





