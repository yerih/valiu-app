
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/PreacherModel.dart';
import '../molecules/CustomAppBar.dart';
import '../styles/StyleText.dart';

class PreacherScreen extends StatefulWidget {
  const PreacherScreen({super.key, required this.preacher, this.onTapItem});
  final void Function(PreacherModel preacher)? onTapItem;
  final PreacherModel preacher;

  @override
  State<StatefulWidget> createState() => _PreacherScreenState();
}

class _PreacherScreenState extends State<PreacherScreen> {

  @override
  Widget build(BuildContext context) {
    final PreacherModel preacher = widget.preacher;
    return Scaffold(
      appBar: CustomAppBar(title: preacher.name),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [

              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(preacher.image),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 100,
              ),
              Text(preacher.name, style: StyleText.titleDetail()),
              SizedBox(height: 20),

              Padding(padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(preacher.bio, style: StyleText.descriptionDetail()),
                      SizedBox(height: 15),



                    ]
                ),
              )


            ]
        ),
      )
    );
  }
}





