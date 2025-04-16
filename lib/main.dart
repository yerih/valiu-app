import 'package:firebase_core/firebase_core.dart';
import 'package:valiu_app/presentation/navigation/Navigation.dart';
import 'package:valiu_app/presentation/screens/LoginScreen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/screens/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valiu App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SideMenu(),
      initialRoute: AppRoutes.home,
      home: const HomeScreen(),
      onGenerateRoute: NavigationGraph.generateRoute,
      // home: const LoginScreen(),
    );
  }
}

