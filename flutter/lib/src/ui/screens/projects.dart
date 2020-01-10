import 'package:flutter/material.dart';
import 'package:portfolio/src/ui/widgets/project.dart';

import 'package:portfolio/src/ui/widgets/shared/scaffold/index.dart';

/// Showcase of each of my projects.
class ProjectsScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    const String lifetoolsDescription =
        '''LifeTools is a *personal project* created for better management of daily habits and daily goals. It helps you building and sticking to habits that matter to you.

This idea came from a lack of any applications matching my expectations in daily routine management. LifeTools is still is in a very early stage. Some crucial features will be implemented over time.

Currently, this repository is open-sourced mostly to *showcase some of my technical skills*.
''';

    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          children: <Widget>[
            Project(
              name: "Life*Tools*",
              description: lifetoolsDescription,
              previewUri:
                  "https://raw.githubusercontent.com/loan-petit/lifetools/media/app_preview.png",
              githubUri: "https://github.com/loan-petit/lifetools",
              demoUri: "",
            ),
          ],
        ),
      ),
    );
  }
}
