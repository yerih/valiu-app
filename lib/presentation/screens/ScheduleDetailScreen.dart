import 'package:flutter/material.dart';
import 'package:valiu_app/core/extensions.dart';
import 'package:valiu_app/data/datasources/CalendarEventAdder.dart';
import '../../core/ProgramModel.dart';
import '../organims/ShareBottomSheetLauncher.dart';
import '../styles/StyleText.dart';



class ScheduleDetailScreen extends StatefulWidget {
  const ScheduleDetailScreen({super.key, required this.program, this.onTapItem});
  final void Function(ProgramModel program)? onTapItem;
  final ProgramModel program;

  @override
  State<StatefulWidget> createState() => _ScheduleDetailScreenState();
}

class _ScheduleDetailScreenState extends State<ScheduleDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isAdded = false;

  @override
  Widget build(BuildContext context) {
    final ProgramModel program = widget.program;
    return Builder(
      builder: (context) => Material(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              foregroundColor: Colors.white,
              automaticallyImplyLeading: true,
              pinned: true,
              expandedHeight: 300,
              backgroundColor: Colors.black,
              flexibleSpace: Stack(
                children: [
                  FlexibleSpaceBar(
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                    centerTitle: false,
                    titlePadding: const EdgeInsets.only(left: 20),
                    collapseMode: CollapseMode.parallax,
                    background: Container(
                      color: Colors.white,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(40)),
                          child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(program.image), fit: BoxFit.cover)
                              )
                          )
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () => shareLink(context, link: program.link),
                  icon: Icon(Icons.share, color: Colors.white),
                )
              ]
            ),


            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(program.title, style: StyleText.titleDetail()),
                        SizedBox(height: 20),

                        Padding(padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${program.date.formatTo(format: 'EEE, MMM d')} | ${program.time}', style: StyleText.descriptionDetail()),
                                SizedBox(height: 15),
                              ]
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {_isAdded = !_isAdded;});
                              addEventToCalendar(program);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                                return _isAdded ? Colors.black : Colors.transparent;
                              }),
                              foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                                return _isAdded ? Colors.white : Colors.blue;
                              }),
                              side: WidgetStateProperty.all(BorderSide(color: Colors.black)),
                            ),
                            child: Text('${_isAdded ? 'Added':'Add'} to schedule', style: TextStyle(color: _isAdded ? Colors.white:Colors.black)),
                          ),
                        ),
                        SizedBox(height: 400,)
                      ]
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}










