


import 'package:flutter/material.dart';
import 'package:valiu_app/core/DayScheduledModel.dart';

import '../atomics/ButtonCircle.dart';

class DaySelector extends StatefulWidget {

  final void Function(int index) onTapItem;
  final List<DayScheduledModel> days;

  const DaySelector({super.key, required this.onTapItem, this.days = const []});

  @override
  State<StatefulWidget> createState() => _DaySelectorState();


}


class _DaySelectorState extends State<DaySelector> {

  int selected = 0;
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    List<DayScheduledModel> days = widget.days;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: (){
                if(selected > 0) {
                  setState(() {selected -= 1;});
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
                      setState(() {selected = days.indexOf(day);});
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
                setState(() {selected += 1;});
                widget.onTapItem.call(days.indexOf(days[selected]));
              }
            },
            icon: Icon(Icons.arrow_forward_ios, color: Colors.grey.shade300,)
          ),
        ]
    );
  }

}


