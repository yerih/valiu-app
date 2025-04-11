

import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final String? image;

  const UserCard({super.key, required this.name, required this.email, this.image});

  @override
  Widget build(BuildContext context) => ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.grey[800],
      child: Icon(
        Icons.person,
        color: Colors.white,
      ),
    ),
    title: Text('User name', style: TextStyle(color: Colors.white, fontSize: 18)),
    subtitle: Text('Hillsong', style: TextStyle(color: Colors.white, fontSize: 14)),
  );



}

