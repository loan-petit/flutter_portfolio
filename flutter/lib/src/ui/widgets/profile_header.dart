import 'package:flutter/material.dart';

/// Header introducing me on the home screen.
class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return _buildForSmallScreen(context);
      } else {
        return _buildForLargeScreen(context);
      }
    });
  }

  Widget _buildForSmallScreen(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 100.0,
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
      ],
    );
  }

  Widget _buildForLargeScreen(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display3;

    return Row(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 100.0,
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
    );
  }
}
