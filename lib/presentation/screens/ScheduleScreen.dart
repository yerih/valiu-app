import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/molecules/CalendarHeader.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';
import 'package:valiu_app/presentation/molecules/DaySelector.dart';

import '../../core/DayScheduledModel.dart';
import '../organims/DatePickerLauncher.dart';
import '../organims/ScheduleListTile.dart';

class ScheduleScreen extends StatefulWidget {
  final List<DayScheduledModel> days;

  const ScheduleScreen({super.key, required this.days});

  @override
  State<StatefulWidget> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    selectedIndex.dispose(); // Important!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = widget.days;//DayScheduledModel.generateDays();
    final globalKeys = List<GlobalKey>.generate(days.length, (index) => GlobalKey());
    return Scaffold(
      appBar: CustomAppBar(title: 'Schedule'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('seeker'),
          CalendarHeader(onTapItem: () async {
            final selectedDate = await launchDatePicker(context, DateTime(2025, 1, 6), DateTime(2025, 1, 8));
            if(selectedDate != null){
              selectedIndex.value = days.indexWhere((element) => element.date == selectedDate);
              debugPrint('selectedIndx: ${selectedIndex.value}');
              _scrollToSection(globalKeys[selectedIndex.value]);
            }
          }),
          DaySelector(
              days: days,
              onTapItem: (index) {
                selectedIndex.value = index;
                _scrollToSection(globalKeys[index]);
              },
              externalSelection: selectedIndex
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
