import 'package:flutter/material.dart';

/// Page with contact informations and social medias.
class ProfileAdditionalInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildSocial(context, textStyle),
        SizedBox(height: 48.0),
        _buildProjects(context, textStyle),
        SizedBox(height: 48.0),
      ],
    );
  }

  Widget _buildSocial(BuildContext context, TextStyle textStyle) {
    double socialIconSize = 64.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Check out those platforms to know more about me:',
          textAlign: TextAlign.center,
          style: textStyle.apply(
            fontWeightDelta: 2,
          ),
        ),
        SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/social/linkedin.png',
              width: socialIconSize,
              height: socialIconSize,
            ),
            SizedBox(width: 24.0),
            Image.asset(
              'assets/social/github.png',
              width: socialIconSize,
              height: socialIconSize,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildProjects(BuildContext context, TextStyle textStyle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'You can also take a look at some projects:',
          textAlign: TextAlign.center,
          style: textStyle.apply(
            fontWeightDelta: 2,
          ),
        ),
        SizedBox(height: 24.0),
        FlatButton(
          color: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            'My projects',
            style: Theme.of(context).textTheme.title.apply(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          onPressed: () {
            print("hello");
          },
        ),
      ],
    );
  }
}
