



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valiu_app/presentation/screens/NewsDetailScreen.dart';
import 'package:valiu_app/presentation/screens/ScheduleScreen.dart';
import 'package:valiu_app/presentation/styles/StyleText.dart';

import '../../core/NewsModel.dart';
import '../../core/PreacherModel.dart';
import '../screens/EventScreen.dart';
import '../screens/HomeScreen.dart';
import '../screens/LeadingScreen.dart';
import '../screens/MapScreen.dart';
import '../screens/PreacherScreen.dart';
import '../screens/ResourcesScreen.dart';
import '../screens/ScriptureScreen.dart';
import '../screens/UpdatesSocialScreen.dart';

class AppRoutes {
  static const String home = '/';
  static const String schedule = '/schedule';
  static const String maps = '/maps';
  static const String leading = '/leadingTheWay';
  static const String eventInfo = '/eventInfo';
  static const String resources = '/resources';
  static const String scripture = '/scripture';
  static const String updates = '/updates';
  static const String details = '/details';
  static const String preacher = '/preacher';
  static const String settings = '/settings';
  static const String profile = '/profile';
}



class NavigationGraph {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home: return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.schedule: return MaterialPageRoute(builder: (_) => const ScheduleScreen());
      case AppRoutes.maps: return MaterialPageRoute(builder: (_) => const MapScreen());
      case AppRoutes.leading: return MaterialPageRoute(builder: (_) => const LeadingScreen());
      case AppRoutes.eventInfo: return MaterialPageRoute(builder: (_) => const EventScreen());
      case AppRoutes.resources: return MaterialPageRoute(builder: (_) => const ResourcesScreen());
      case AppRoutes.scripture: return MaterialPageRoute(builder: (_) => const ScriptureScreen());
      case AppRoutes.updates: return MaterialPageRoute(builder: (_) => const UpdatesSocialScreen());

      case AppRoutes.details:
        final news = settings.arguments as NewsModel;
        return MaterialPageRoute(builder: (_) => NewsDetailScreen(news: news));
      case AppRoutes.preacher:
        final preacher = settings.arguments as PreacherModel;
        return MaterialPageRoute(builder: (_) => PreacherScreen(preacher: preacher));
      case AppRoutes.settings:
        // return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppRoutes.profile:
        // return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}', style: StyleText.drawerItem()),
            ),
          ),
        );
    }
  }
}





