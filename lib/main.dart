import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:valiu_app/presentation/navigation/Navigation.dart';
import 'package:valiu_app/presentation/screens/LoginScreen.dart';
import 'data/datasources/NotificationManager.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/screens/HomeScreen.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
Future<void> myBackgroundMessageHandler(NotificationResponse notificationResponse) async {
  debugPrint('Handling a background message ${notificationResponse.payload}');
  // You can perform background tasks here, like making API calls, etc.
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationManager.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valiu App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      home: const LoginScreen(),
      // home: const HomeScreen(),
      onGenerateRoute: NavigationGraph.generateRoute,
    );
  }
}

