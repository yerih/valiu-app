import 'package:flutter/material.dart';
import '../../core/ProgramModel.dart';
import 'ShareBottomSheetLauncher.dart';


void launchBottomSheet(BuildContext context, {required ProgramModel program,}) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Center(
                      child: Text(
                        '${program.isAdded ? 'Added' : 'Add'} to Schedule',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);

                      // Handle logic
                    },
                  ),
                  Divider(height: 0.1, color: Colors.grey.shade200),
                  ListTile(
                    title: Center(child: Text('Share to...')),
                    onTap: () {
                      Navigator.pop(context);
                      shareLink(context, link: program.link);
                    },
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 16, right: 16, left: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                title: Center(child: Text('Cancel', style: TextStyle(color: Colors.black))),
                onTap: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      );
    },
  );
}


