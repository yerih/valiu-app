import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';



Future<void> shareLink(BuildContext context, { String link = 'https://flutter.dev'}) async {
  try {
    await Share.share(
      link,
      subject: 'Check this link',
    );
  } catch (e) {
    debugPrint(e.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Failed to share')),
    );
  }
}



