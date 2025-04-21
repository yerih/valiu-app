import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valiu_app/core/extensions.dart';
import '../../core/NewsModel.dart';
import '../molecules/CustomAppBar.dart';
import '../styles/StyleText.dart';


class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key, this.news});
  final NewsModel? news;

  @override
  State<StatefulWidget> createState() => _LeadingScreenState();
}

class _LeadingScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final news = widget.news;
    return Scaffold(
      appBar: CustomAppBar(title: news != null ? news.title : 'News no title'),
      body: news != null ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(news.date.toDetailed(), style: StyleText.detailedDate()),
                ),
            ),
            SizedBox(height: 15),

            Text(news.title, style: StyleText.titleDetail()),
            SizedBox(height: 20),

            Padding(padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(news.description, style: StyleText.descriptionDetail()),
                  SizedBox(height: 15),

                  InkWell(
                    onTap: () async {
                      final url = Uri.parse(news.link);
                      await canLaunchUrl(url) ? await launchUrl(url) : throw 'Could not launch $url';
                    },
                    child: Text('Register now for Passion 2026', style: StyleText.link(),),
                  )

                ]
              ),
            )


          ]
        ),
      ) :  Center(
        child: Text(
          'Invalid news',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
