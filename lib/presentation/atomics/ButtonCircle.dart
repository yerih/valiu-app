import 'package:flutter/material.dart';

class ButtonCircle extends StatelessWidget {
  final GestureTapCallback onTap;
  final String letter;
  final String footer;

  const ButtonCircle({
    super.key,
    required this.onTap,
    this.letter = '',
    this.footer = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(letter, style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 1),
            Text(footer, style: TextStyle(fontSize: 12,color: Colors.grey.shade500))
          ],
        ),
      ),
    );
  }
}
