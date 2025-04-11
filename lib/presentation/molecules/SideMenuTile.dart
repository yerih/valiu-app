
import 'package:flutter/material.dart';

class SideMenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const SideMenuTile({super.key, required this.title, required this.icon, this.onTap});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white,),
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
      onTap: onTap??(){},
    );
  }
}




