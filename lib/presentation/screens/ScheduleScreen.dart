import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';
import 'package:valiu_app/presentation/molecules/DaySelector.dart';

import '../../core/DayScheduledModel.dart';
import '../organims/ScheduleListTile.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final days = DayScheduledModel.generateDays();
    final globalKeys = List<GlobalKey>.generate(days.length, (index) => GlobalKey());
    return Scaffold(
      appBar: CustomAppBar(title: 'Schedule'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('seeker'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Calendar'),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.edit_outlined, size: 13, color: Colors.grey.shade500),
                  iconAlignment: IconAlignment.end,
                  label: Text('Select Date', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                ),
              ],
            ),
          ),

          Container(
              padding: EdgeInsets.only(bottom: 7),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.0))),
              child: DaySelector(days: days, onTapItem: (index) { _scrollToSection(globalKeys[index]);}),
          ),

          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  ...days.map((day) => ScheduleListTile(day: day, key: globalKeys[days.indexOf(day)])),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
