import 'package:flutter/material.dart';

import 'package:portfolio/src/ui/widgets/projects/lifetools.dart';
import 'package:portfolio/src/ui/widgets/shared/scaffold/index.dart';

/// Showcase of each of my projects.
class ProjectsScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          children: <Widget>[
            LifeTools(),
          ],
        ),
      ),
    );
  }
}
