import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/styles/StyleText.dart';


var drawer = Drawer(
  backgroundColor: Colors.transparent,
  child: Container(
    decoration: BoxDecoration(
      color: Colors.black,
      image: DecorationImage(
        image: AssetImage('assets/images/drawer_bg.jpg'),
        fit: BoxFit.cover,
      ),
      border: null
    ),
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.transparent, border: Border.all(color: Colors.transparent)),
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                left: 10,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.search, color: Colors.white),
                      onPressed: () {}
                    ),
                    IconButton(
                        icon: Icon(Icons.notifications, color: Colors.white),
                        onPressed: () {}
                    ),
                    IconButton(
                        icon: Icon(Icons.person, color: Colors.white),
                        onPressed: () {}
                    ),
                  ]
                )
              )
            ]
          ),
        ),

        ListTile(
          leading: Icon(Icons.home_outlined, color: Colors.white,),
          title: Text('Home', style: StyleText.drawerItem()),
          onTap: () => {
            // Navigator.pop(context);
          },
        ),

        ListTile(
          leading: Icon(Icons.settings_outlined, color: Colors.white),
          title: Text('Settings', style: StyleText.drawerItem()),
          onTap: () => {
            // Navigator.pop(context);
          },
        ),
      ],
    ),
  ),
);
