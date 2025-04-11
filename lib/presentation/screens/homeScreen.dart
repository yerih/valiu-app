import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/atomics/BlurredBackground.dart';
import 'package:valiu_app/presentation/styles/StyleText.dart';

import '../organims/CustomDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              pinned: true,
              expandedHeight: 400,
              backgroundColor: Colors.black,
              flexibleSpace: FlexibleSpaceBar(
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Featured', style: textDrawerItem),
                    Container(
                      margin: const EdgeInsets.only(top: 4.0),
                      height: 3.0,
                      width: 60,// Adjust width as needed
                      decoration: BoxDecoration(
                        color: Colors.white, // Or your preferred color
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      ),
                    ),
                  ],
                ),
                // title: Text('Featured', style: textDrawerItem),
                centerTitle: false,
                titlePadding: const EdgeInsets.only(left: 20),
                collapseMode: CollapseMode.parallax,
                background: ClipRRect(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
                  child: Image(
                    image: AssetImage('assets/images/img.png'),
                    fit: BoxFit.cover,
                  )
                )
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                    childCount: 100
                )
            )
          ],
        )
    );


    // return MaterialApp(
    //   home: Scaffold(
    //     drawer: drawer,//CustomDrawer(),
    //     body: Builder(
    //       builder: (BuildContext context) {
    //         return BlurredBackground(
    //           imagePath: 'assets/images/img.png',
    //           child: SizedBox.expand(
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 Text('Center', style: textDrawerItem),
    //                 Text('Center', style: textDrawerItem),
    //                 ElevatedButton(
    //                   onPressed: () {
    //                     Scaffold.of(context).openDrawer();
    //                   },
    //                   child: const Text('Open Drawer'),
    //                 ),
    //               ],
    //             )
    //           )
    //         );
    //
    //       }
    //     ),
    //   )
    // );
  }
}
