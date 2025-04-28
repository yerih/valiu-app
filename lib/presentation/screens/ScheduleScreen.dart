import 'package:flutter/material.dart';
import 'package:valiu_app/data/datasources/firebase_database_service.dart';
import 'package:valiu_app/presentation/molecules/CalendarHeader.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';
import 'package:valiu_app/presentation/molecules/DaySelector.dart';
import 'package:valiu_app/presentation/molecules/SearchBar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../core/DayScheduledModel.dart';
import '../organims/DatePickerLauncher.dart';
import '../organims/ScheduleListTile.dart';

class ScheduleScreen extends StatefulWidget {

  const ScheduleScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);
  List<DayScheduledModel> filtered = <DayScheduledModel>[];
  List<DayScheduledModel> original = <DayScheduledModel>[];
  List<DayScheduledModel> days = <DayScheduledModel>[];

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {selectedIndex.dispose(); super.dispose();}

  @override
  void initState() {
    super.initState();
    FirebaseRealTimeDB.getSchedule()
        .then((value) {
      setState(() {
        original = value;
        days = original;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final globalKeys = List<GlobalKey>.generate(days.length, (index) => GlobalKey());
    return Scaffold(
      appBar: CustomAppBar(title: 'Schedule'),
      body: days.isEmpty ? Container(): Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBarApp(onChanged: (value) {
            setState(() {
              if(value.isNotEmpty){
                filtered = original.map((e) =>
                    DayScheduledModel(
                        date: e.date,
                        monthName: e.monthName,
                        name: e.name,
                        number: e.number,
                        programs: e.programs.where((p) => p.title.toLowerCase().contains(value.toLowerCase())).toList()
                    )
                ).where((e) => e.programs.isNotEmpty).toList();
                days = filtered;
              }
              else{
                filtered = <DayScheduledModel>[];
                days = original;
              }
            });
          }),
          CalendarHeader(
              isNotEmpty: days.isNotEmpty,
              onTapItem: () async {
                final selectedDate = await launchDatePicker(
                    context, days[selectedIndex.value].date, days.first.date, days.last.date);
                if (selectedDate != null) {
                  selectedIndex.value = days.indexWhere((element) => element.date == selectedDate);
                  debugPrint('selectedIndx: ${selectedIndex.value}');
                  _scrollToSection(globalKeys[selectedIndex.value]);
                }
              }
          ),
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
            ) : Center(child: Column(
              children: [
                SizedBox(height: 10,),
                Text('No results', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 10,),
                Text('Try searching again or later for results', style: TextStyle(color: Colors.grey)),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
