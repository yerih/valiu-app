
import 'package:flutter/material.dart';



class SearchBarApp extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const SearchBarApp({Key? key, this.onChanged}) : super(key: key);

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  final TextEditingController _controller = TextEditingController();


  @override
  void initState() {
    super.initState();
    _controller.addListener((){ setState(() {

    });});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        maxLines: 1,
        minLines: 1,
        controller: _controller,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(color: Colors.black, fontSize: 16, height: 1),
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          icon: Icon(Icons.search, color: Colors.grey.shade500),
          border: InputBorder.none,
          suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => _controller.clear(),
              icon: Icon(Icons.clear, color: Colors.grey.shade500, size: 20,)
          ),
          suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 20),
        ),
      ),
    );
  }
}

