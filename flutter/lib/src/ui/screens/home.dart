import 'package:flutter/material.dart';
import 'package:portfolio/src/ui/widgets/profile_header.dart';

import 'package:portfolio/src/ui/widgets/shared/scaffold.dart';

/// Porfolio home screen.
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: screenHeight / 8),
          ProfileHeader(),
        ],
      ),
    );
  }
}
