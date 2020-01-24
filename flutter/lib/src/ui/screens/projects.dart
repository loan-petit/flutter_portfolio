import 'package:flutter/material.dart';
import 'package:portfolio/src/app_localizations.dart';
import 'package:portfolio/src/ui/widgets/project.dart';

import 'package:portfolio/src/ui/widgets/shared/scaffold/index.dart';

/// Showcase of each of my projects.
class ProjectsScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        children: <Widget>[
          Project(
            name: AppLocalization.of(context).lifetoolsName,
            description: AppLocalization.of(context).lifetoolsDescription,
            previewUri:
                "https://raw.githubusercontent.com/loan-petit/lifetools/media/app_preview.png",
            githubUri: "https://github.com/loan-petit/lifetools",
            demoUri: "",
          ),
        ],
      ),
    );
  }
}
