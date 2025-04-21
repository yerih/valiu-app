import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valiu_app/core/Result.dart';
import 'package:valiu_app/data/datasources/firebase_database_service.dart';
import 'package:valiu_app/data/repositories/AuthRepository.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthRepository authRepo = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ), // Corner radius
        ),
        child: const Text('Login'),
        onPressed: () async {

          FirebaseMessaging messaging = FirebaseMessaging.instance;
          NotificationSettings settings = await messaging.requestPermission(
            alert: true,
            announcement: false,
            badge: true,
            carPlay: false,
            criticalAlert: false,
            provisional: false,
            sound: true,
          );
          debugPrint('User granted permission: ${settings.authorizationStatus}');
          final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
          debugPrint(apnsToken != null ? 'cloudMssaging token: $apnsToken':'cloudMssaging token: null');

          FirebaseMessaging.onMessage.listen((RemoteMessage message) {
            debugPrint('Got a message whilst in the foreground!');
            debugPrint('Message data: ${message.data}');

            if (message.notification != null) {
              debugPrint('Message also contained a notification: ${message.notification}');
            }
          });
          // final list = await FirebaseRealTimeDB.getNews();
          // debugPrint(list.toString());
          // final result = await authRepo.signUp(email: 'a@a.com', password: 'password1.');
          // final result = await authRepo.signIn(email: 'a@a.com', password: 'password1.');
          // switch(result){
          //   case Result(isSuccess: true): debugPrint('signIn success'); break;
          //   case Result(isError: true): debugPrint('signIn error: ${result.message}'); break;
          //   default: break;
          // }
        },
      ),
    );
  }


}
