import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/navigation/Navigation.dart';
import 'package:valiu_app/presentation/organims/BottomSheetLauncher.dart';
import '../../core/ProgramModel.dart';


class ProgramListTile extends StatelessWidget{
  final ProgramModel program;
  const ProgramListTile({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5,),
              child: Text(program.time, style: TextStyle(fontSize: 13)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.scheduleDetail, arguments: program);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.0,)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 7, bottom: 7, left: 15, right: 0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage(program.image), fit: BoxFit.cover,),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(program.title, style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    IconButton(
                      onPressed: () => launchBottomSheet(context, program: program),
                      icon: Icon(Icons.more_vert, color: Colors.grey.shade400,),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }
}



