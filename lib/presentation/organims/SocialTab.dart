



import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valiu_app/core/SocialNetworkModel.dart';

import '../../data/datasources/firebase_database_service.dart';

class SocialTab extends StatefulWidget {
  const SocialTab({super.key});

  @override
  State<StatefulWidget> createState() => _SocialTabState();
}

class _SocialTabState extends State<SocialTab> {
  List<SocialNetworkModel> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    FirebaseRealTimeDB.getSocialNetworks().then((value) => setState(() {
      items = value;
      isLoading = false;
      // debugPrint('items: $items');
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.0,))
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Social feeds', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          isLoading ? SizedBox():
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.0))
                ),
                child: ListTile(
                  onTap: () => items[index].link != null ? launchUrl(Uri.parse(items[index].link!)) : null,
                  title: Text(items[index].name!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  leading: switch(items[index].name!.toLowerCase()){
                    'facebook' => Icon(FontAwesomeIcons.facebook, color: Colors.blue,),
                    'instagram' => Icon(FontAwesomeIcons.instagram, color: Colors.blue,),
                    'tiktok' => Icon(FontAwesomeIcons.tiktok, color: Colors.blue,),
                    'x' => Icon(FontAwesomeIcons.xTwitter, color: Colors.blue,),
                    'youtube' => Icon(FontAwesomeIcons.youtube, color: Colors.blue,),
                    'twitch' => Icon(FontAwesomeIcons.twitch, color: Colors.blue,),
                    'discord' => Icon(FontAwesomeIcons.discord, color: Colors.blue,),
                    'whatsapp' => Icon(FontAwesomeIcons.whatsapp, color: Colors.blue,),
                    'email' => Icon(Icons.email, color: Colors.blue,),
                    String() => Icon(Icons.language, color: Colors.blue,),
                  },
                  trailing: Text(items[index].username!, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                ),
              ),
            ),
          ),
        ]
    );
  }

}




