import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/molecules/CalendarHeader.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';
import 'package:valiu_app/presentation/molecules/DaySelector.dart';
import 'package:valiu_app/presentation/molecules/SearchBar.dart';
import 'package:visibility_detector/visibility_detector.dart';
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
  List<DayScheduledModel> filtered = <DayScheduledModel>[];
  late List<DayScheduledModel> original;
  late List<DayScheduledModel> days;

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
  void initState() {
    super.initState();
    original = widget.days;
    days = original;
  }

  @override
  Widget build(BuildContext context) {
    // days = widget.days;//DayScheduledModel.generateDays();
    final globalKeys = List<GlobalKey>.generate(days.length, (index) => GlobalKey());
    return Scaffold(
      appBar: CustomAppBar(title: 'Schedule'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBarApp(onChanged: (value) {
            debugPrint(value);
            if(value.isNotEmpty) {
              setState(() {
                filtered = original.where((e) => e.name.toLowerCase().contains(value.toLowerCase())).toList();
                debugPrint('filtered now: $filtered');
                days = filtered;
                debugPrint('days now: $days');
              });
            } else{
              setState(() {
                filtered = <DayScheduledModel>[];
                days = original;
              });
              debugPrint('filtered now: $filtered');
              debugPrint('days now: $days');
            }
          }),
          CalendarHeader(onTapItem: () async {
            final selectedDate = await launchDatePicker(context, days[selectedIndex.value].date, days.first.date, days.last.date);
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
            child: days.isNotEmpty ? ListView.builder(
              controller: _scrollController,
              itemCount: days.length,
              itemBuilder: (context, index) {
                final day = days[index];
                return ScheduleListTile(
                    day: day,
                    keyId: globalKeys[days.indexOf(day)],
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (info.visibleFraction >= 1) selectedIndex.value = days.indexOf(day);
                    },
                );
                }
            ) : Center(child: Text('No results')),
          ),


          // Expanded(
          //   child: days.isNotEmpty ? SingleChildScrollView(
          //     controller: _scrollController,
          //     child: Column(
          //       children: [
          //         ...days.map((day) =>
          //             ScheduleListTile(
          //               day: day,
          //               keyId: globalKeys[days.indexOf(day)],
          //               onVisibilityChanged: (VisibilityInfo info) {
          //                 if (info.visibleFraction >= 1) selectedIndex.value = days.indexOf(day);
          //               },
          //             )
          //         ),
          //       ],
          //     ),
          //   ) : Center(child: Text('No results')),
          // ),
        ],
      ),
    );
  }
}
