



import 'package:flutter/material.dart';
import '../../core/DayScheduledModel.dart';
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

  @override
  Widget build(BuildContext context) {
    final ProgramModel program = widget.program;
    return Builder(
      builder:
          (context) => CustomScrollView(
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
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20),),
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(program.image),
                                    fit: BoxFit.cover
                                )
                            )
                        )
                    ),
                  ),
                ),
              ],
            ),
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
                              Text(program.time, style: StyleText.textDetail()),
                              SizedBox(height: 15),
                            ]
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
    );
  }
}










