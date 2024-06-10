import 'package:dinckallapp/pages/login.dart';
import 'package:flutter/material.dart';

import '../pages/exercise_page.dart';
import '../pages/profile.dart';
import '../pages/settings_page.dart';
import '../view/home/home.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/exercise':
        return MaterialPageRoute(builder: (_) => ExerciseScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
