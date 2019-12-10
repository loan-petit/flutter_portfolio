import 'package:flutter/material.dart';

import 'package:portfolio/src/app.dart';
import 'package:portfolio/src/environment.dart';

void main() async {
  // Setup production environment
  Environment.prod();

  runApp(App());
}
