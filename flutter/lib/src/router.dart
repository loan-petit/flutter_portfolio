import 'package:flutter/material.dart';

import 'package:portfolio/src/ui/screens/home.dart';

/// Build the appropriate [MaterialPageRoute] on route navigation.
class Router {
  /// Callback function used by the [MaterialApp] on route navigation.
  ///
  /// The requested routed is described in [settings].
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
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
