import 'package:flutter/material.dart';

/// Header introducing me on the home screen.
class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Hello,',
                style: Theme.of(context).textTheme.display4.apply(
                      fontWeightDelta: 2,
                    ),
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .display4
                      .apply(fontWeightDelta: 3),
                  children: <TextSpan>[
                    TextSpan(text: "I'm "),
                    TextSpan(
                      text: 'Loan PETIT',
                      style: Theme.of(context).textTheme.display4.apply(
                          fontWeightDelta: 3,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 120.0,
          child: ClipOval(
            child: Image.asset(
              'assets/png/profile_alpha.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
