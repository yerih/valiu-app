



import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialTab extends StatefulWidget {
  const SocialTab({super.key});

  @override
  State<StatefulWidget> createState() => _SocialTabState();
}

class _SocialTabState extends State<SocialTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              )
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Social feeds', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.instagram, color: Colors.blue,),
                Text('Instagram')
              ]
            ),
          ),

        ]
    );
  }

}




