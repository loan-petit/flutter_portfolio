import 'package:flutter/material.dart';

import 'package:portfolio/src/ui/widgets/profile/profile_additional_informations.dart';
import 'package:portfolio/src/ui/widgets/profile/profile_header.dart';
import 'package:portfolio/src/ui/widgets/shared/scaffold.dart';

/// Porfolio home screen.
class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _buildFirstPage(context),
          ProfileAdditionalInformations(),
        ],
      ),
    );
  }

  Widget _buildFirstPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: ProfileHeader(),
        ),
        _buildBottomButton(context),
      ],
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle textStyle = (screenWidth < 600)
        ? Theme.of(context).textTheme.subhead
        : Theme.of(context).textTheme.title;

    return FlatButton(
      child: Column(
        children: <Widget>[
          if (screenWidth > 400)
            Text(
              "Want to know more ? Scroll down.",
              style:
                  textStyle.apply(color: Theme.of(context).colorScheme.primary),
            ),
          Icon(
            Icons.expand_more,
            color: Theme.of(context).colorScheme.primary,
            size: (screenWidth < 600) ? 30.0 : 50.0,
          ),
        ],
      ),
      onPressed: () {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      },
    );
  }
}
