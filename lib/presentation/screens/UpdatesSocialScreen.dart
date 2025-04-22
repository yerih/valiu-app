import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:valiu_app/data/datasources/firebase_database_service.dart';
import 'package:valiu_app/presentation/molecules/CustomAppBar.dart';

import '../organims/SocialTab.dart';

class UpdatesSocialScreen extends StatefulWidget {
  const UpdatesSocialScreen({super.key});

  @override
  State<StatefulWidget> createState() => _UpdatesSocialScreenState();
}

class _UpdatesSocialScreenState extends State<UpdatesSocialScreen> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    Center(child: Text('Updates')),
    SocialTab(),
    // Center(child: Text('Social')),
  ];

  void _onItemTapped(int index) async {
    final sn = await FirebaseRealTimeDB.getSocialNetworks();
    debugPrint('social networks: $sn');
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Updates + social'),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Material(
        elevation: 10,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'Updates',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.forum),
              label: 'Social',
            ),
          ],
        ),
      )
    );
  }
}
