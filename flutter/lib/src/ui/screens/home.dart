import 'package:flutter/material.dart';
import 'package:portfolio/src/ui/widgets/profile_header.dart';

import 'package:portfolio/src/ui/widgets/shared/scaffold.dart';

/// Porfolio home screen.
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 32.0),
          ProfileHeader(),
        ],
      ),
    );
  }
}
