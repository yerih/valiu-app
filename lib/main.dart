import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:valiu_app/presentation/navigation/Navigation.dart';
import 'package:valiu_app/presentation/organims/SocialTab.dart';
import 'package:valiu_app/presentation/screens/LoginScreen.dart';
import 'package:valiu_app/presentation/screens/ScheduleScreen.dart';
import 'package:valiu_app/presentation/screens/UpdatesSocialScreen.dart';
import 'core/DayScheduledModel.dart';
import 'data/datasources/NotificationManager.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/screens/HomeScreen.dart';




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
    final days = DayScheduledModel.generateDays();
    return MaterialApp(
      title: 'Valiu App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      home: ScheduleScreen(days: days),
      // home: const HomeScreen(),
      onGenerateRoute: NavigationGraph.generateRoute,
    );
  }
}

