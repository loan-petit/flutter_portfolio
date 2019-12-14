import 'package:flutter/material.dart';

/// Header introducing me on the home screen.
class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 1200) {
      return _buildForSmallScreen(context);
    } else {
      return _buildForLargeScreen(context);
    }
  }

  Widget _buildForSmallScreen(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle textStyle = (screenWidth < 400)
        ? Theme.of(context).textTheme.display1
        : Theme.of(context).textTheme.display2;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: (screenWidth < 360) ? 50.0 : 80.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/png/profile.png'),
        ),
        SizedBox(height: 32.0),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: textStyle.apply(fontWeightDelta: 3),
            children: <TextSpan>[
              TextSpan(text: "Hello, I'm "),
              TextSpan(
                text: 'Loan PETIT',
                style: textStyle.apply(
                    fontWeightDelta: 3,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        SizedBox(height: 64.0),
        _buildShortSummary(
            context,
            (screenWidth < 600)
                ? Theme.of(context).textTheme.headline
                : Theme.of(context).textTheme.display1),
      ],
    );
  }

  Widget _buildForLargeScreen(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display4;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 150.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/png/profile.png'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Hello,',
                    style: textStyle.apply(
                      fontWeightDelta: 2,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: textStyle.apply(fontWeightDelta: 3),
                      children: <TextSpan>[
                        TextSpan(text: "I'm "),
                        TextSpan(
                          text: 'Loan PETIT',
                          style: textStyle.apply(
                              fontWeightDelta: 3,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 152.0),
        _buildShortSummary(context, Theme.of(context).textTheme.display2),
      ],
    );
  }

  Widget _buildShortSummary(BuildContext context, TextStyle textStyle) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: textStyle,
        children: <TextSpan>[
          TextSpan(text: "I am a "),
          TextSpan(
            text: 'freelance developer',
            style:
                textStyle.apply(color: Theme.of(context).colorScheme.primary),
          ),
          TextSpan(
              text:
                  ' passionate about innovative, disruptive and ambitious projects.')
        ],
      ),
    );
  }
}
