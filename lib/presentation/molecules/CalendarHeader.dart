


import 'package:flutter/material.dart';

class CalendarHeader extends StatefulWidget {
  CalendarHeader({super.key, required this.onTapItem, this.isNotEmpty = true});
  final void Function() onTapItem;
  bool isNotEmpty = true;

  @override
  State<StatefulWidget> createState() => _CalendarHeaderState();

}

class _CalendarHeaderState extends State<CalendarHeader> {
  @override
  Widget build(BuildContext context) {
    return widget.isNotEmpty ? Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Calendar'),
          TextButton.icon(
            onPressed: widget.onTapItem,
            icon: Icon(Icons.edit_outlined, size: 13, color: Colors.grey.shade500),
            iconAlignment: IconAlignment.end,
            label: Text('Select Date', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
          ),
        ],
      ),
    ) : Container();
  }
}
