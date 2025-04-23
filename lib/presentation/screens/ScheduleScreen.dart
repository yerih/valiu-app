import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';

import '../atomics/ButtonCircle.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _section1Key = GlobalKey();
  final GlobalKey _section2Key = GlobalKey();
  final GlobalKey _section3Key = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Schedule'),
      body: Column(
        children: [
          // Selector buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TextButton(
                  onPressed: () => _scrollToSection(_section1Key),
                  child: Text('Section 1'),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(_section2Key),
                  child: Text('Section 2'),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(_section3Key),
                  child: Text('Section 3'),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  _buildSection('Section 1', Colors.orange, key: _section1Key),
                  _buildSection('Section 2', Colors.green, key: _section2Key),
                  _buildSection('Section 3', Colors.blue, key: _section3Key),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Color color, {required Key key}) {
    return Container(
      key: key,
      height: 400,
      color: color,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
  */
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {  },
                  icon: Icon(Icons.edit_outlined, size: 13, color: Colors.grey.shade500,),
                  iconAlignment: IconAlignment.end,
                  label: Text('Select Date', style: TextStyle(fontSize: 12, color: Colors.grey.shade500),),
                ),
              ],
            ),
          ),


          Container(
            padding: EdgeInsets.only(bottom: 7),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.0,))
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios, color: Colors.grey.shade300,)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ButtonCircle(
                          onTap: () {},
                          letter: '6',
                          footer: 'Mon'
                        ),
                        ButtonCircle(
                          onTap: () {},
                          letter: '7',
                          footer: 'Tue'
                        ),
                        ButtonCircle(
                          onTap: () {},
                          letter: '8',
                          footer: 'Wed'
                        ),
                      ]
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios, color: Colors.grey.shade300,)),
                ]
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
          )

        ],
      )
    );
  }
}
