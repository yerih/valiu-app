import 'package:flutter/material.dart';
import 'package:valiu_app/core/PreacherModel.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';

import '../../core/Result.dart';
import '../../data/repositories/PreachersRepository.dart';
import '../navigation/Navigation.dart';

class LeadingScreen extends StatefulWidget {
  const LeadingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LeadingScreenState();
}

class _LeadingScreenState extends State<LeadingScreen> {
  List<PreacherModel> list = [];

  @override
  void initState() {
    super.initState();
    _getPreachers();
  }

  void _getPreachers() async {
    final result = await PreachersRepository().getPreachers();
    if(result.isSuccess){
      setState(() {
        final aux = result.data!;
        aux.sort((a, b) => a.name.compareTo(b.name));
        list = aux;
      });
      debugPrint('isSuccess: $list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Leading the way'),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final preacher = list[index];
          final currentLetter = preacher.name[0].toUpperCase();
          final bool showHeader = index == 0 || currentLetter != list[index - 1].name[0].toUpperCase();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (showHeader)Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
                  color: Color.fromARGB(50, 316, 316, 316),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Text(currentLetter, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: ListTile(
                  onTap: () async {
                    Navigator.pushNamed(context, AppRoutes.preacher, arguments: list[index]);
                  },
                  title: Text(preacher.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  leading: CircleAvatar(backgroundImage: NetworkImage(preacher.image),),
                ),
              )
            ],
          );
        },
      )
    );
  }
}
