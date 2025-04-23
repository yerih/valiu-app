import 'package:flutter/material.dart';

class ButtonCircle extends StatelessWidget {
  final GestureTapCallback onTap;
  final String letter;
  final String footer;

  final Color backgroundColor;
  final Color textColor;

  const ButtonCircle({
    super.key,
    required this.onTap,
    this.letter = '',
    this.footer = '',
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.black,
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
              maxRadius: 15,
              backgroundColor: backgroundColor,
              child: Text(letter, style: TextStyle(color: textColor)),
            ),
            SizedBox(height: 1),
            Text(footer, style: TextStyle(fontSize: 12,color: Colors.grey.shade500))
          ],
        ),
      ),
    );
  }
}
