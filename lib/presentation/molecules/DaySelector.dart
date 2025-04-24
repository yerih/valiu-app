


import 'package:flutter/material.dart';
import 'package:valiu_app/core/DayScheduledModel.dart';

import '../atomics/ButtonCircle.dart';

class DaySelector extends StatefulWidget {

  final void Function(int index) onTapItem;
  final List<DayScheduledModel> days;
  final ValueNotifier<int> externalSelection;

  const DaySelector({super.key, required this.onTapItem, this.days = const [], required this.externalSelection});

  @override
  State<StatefulWidget> createState() => _DaySelectorState();


}


class _DaySelectorState extends State<DaySelector> {

  int selected = 0;
  Color color = Colors.transparent;


  @override
  Widget build(BuildContext context) {
    List<DayScheduledModel> days = widget.days;
    return ValueListenableBuilder<int>(
      valueListenable: widget.externalSelection,
      builder: (context, value, child) {
        selected = value;
        return Container(
          padding: EdgeInsets.only(bottom: 7),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.0))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: (){
                      if(selected > 0) {
                        selected -= 1;
                        widget.onTapItem.call(days.indexOf(days[selected]));
                      }
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.grey.shade300,)
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...days.map((day) =>
                          ButtonCircle(
                            onTap: () {
                              widget.onTapItem.call(days.indexOf(day));
                            },
                            letter: day.number,
                            footer: day.name.substring(0, 3),
                            backgroundColor: selected == days.indexOf(day) ? Colors.black : Colors.transparent,
                            textColor: selected == days.indexOf(day) ? Colors.white : Colors.black,
                          )
                      )
                    ]
                ),
                IconButton(
                    onPressed: (){
                      if(selected < days.length-1) {
                        selected += 1;
                        widget.onTapItem.call(days.indexOf(days[selected]));
                      }
                    },
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.grey.shade300,)
                ),
              ]
          ),
        );
      }
    );
  }

}


