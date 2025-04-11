import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../atomics/UserCard.dart';
import '../molecules/SideMenuTile.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<StatefulWidget> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    const thickness = 0.2;
    return Scaffold(
      body: Expanded(
        child: Container(
          width: 288,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage('assets/images/drawer_bg.jpg'),
              fit: BoxFit.cover,
            ),
            border: null,
          ),
          child: SafeArea(
              child: Column(
                  children: [
                    UserCard(name: 'Test name', email: 'test@mail.com'),
                    Divider(color: Colors.white, thickness: thickness),
                    SideMenuTile(title: 'Home', icon: Icons.home_outlined),
                    SideMenuTile(title: 'Schedule', icon: Icons.calendar_today_outlined),
                    SideMenuTile(title: 'Maps', icon: Icons.location_on_outlined),
                    SideMenuTile(title: 'Leading the way', icon: Icons.person_outline),
                    SideMenuTile(title: 'Event info', icon: Icons.info_outline),
                    SideMenuTile(title: 'Resources', icon: Icons.checkroom),
                    SideMenuTile(title: 'Scripture translation', icon: Icons.menu_book_outlined),
                    SideMenuTile(title: 'Updates + social', icon: Icons.book_online_outlined),

                  ]
              )
          ),
        ),
      ),
    );
  }
}
