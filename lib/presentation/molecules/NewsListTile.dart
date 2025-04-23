

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:valiu_app/core/extensions.dart';

class NewsListTile extends StatelessWidget {
  final DateTime date;
  final String title;

  const NewsListTile({super.key, required this.date, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Text(date.toDetailed(), style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
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
                Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),),
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
    );
  }

}



