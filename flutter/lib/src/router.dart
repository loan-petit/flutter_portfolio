import 'package:flutter/material.dart';

import 'package:portfolio/src/ui/screens/home.dart';
import 'package:portfolio/src/ui/screens/projects.dart';

/// Build the appropriate [MaterialPageRoute] on route navigation.
class Router {
  /// Callback function used by the [MaterialApp] on route navigation.
  ///
  /// The requested routed is described in [settings].
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Showcase of my projects
      case '/projects':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProjectsScreen(),
        );
      // Display the home screen
      case '/index':
      case '/home':
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomeScreen(),
        );
    }
  }
}
