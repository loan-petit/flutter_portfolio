import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';

/// Page with contact informations and social medias.
class ProfileAdditionalInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    TextStyle textStyle = (screenWidth < 600)
        ? Theme.of(context).textTheme.headline
        : Theme.of(context).textTheme.display1;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildSocial(context, screenWidth, textStyle),
        SizedBox(height: (screenWidth < 600) ? 32.0 : 48.0),
        _buildProjects(context, screenWidth, textStyle),
        SizedBox(height: (screenWidth < 600) ? 32.0 : 48.0),
        _buildContact(context, screenWidth, textStyle),
      ],
    );
  }

  Widget _buildSocial(
      BuildContext context, double screenWidth, TextStyle textStyle) {
    double socialIconSize = (screenWidth < 600) ? 48.0 : 64.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Want to know more about me ? Check out those platforms!',
          textAlign: TextAlign.center,
          style: textStyle,
        ),
        SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Image.asset(
                'assets/social/linkedin.png',
                width: socialIconSize,
                height: socialIconSize,
              ),
              onPressed: () async =>
                  await _launchUrl('https://fr.linkedin.com/in/loanpetit'),
            ),
            SizedBox(width: 24.0),
            FlatButton(
              child: Image.asset(
                'assets/social/github.png',
                width: socialIconSize,
                height: socialIconSize,
              ),
              onPressed: () async =>
                  await _launchUrl('https://github.com/loan-petit'),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildProjects(
      BuildContext context, double screenWidth, TextStyle textStyle) {
    TextStyle labelStyle = (screenWidth < 600)
        ? Theme.of(context).textTheme.subhead
        : Theme.of(context).textTheme.title;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'I also have some projects to show you.',
          textAlign: TextAlign.center,
          style: textStyle,
        ),
        SizedBox(height: 24.0),
        FlatButton.icon(
          color: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          icon:
              Icon(Icons.work, color: Theme.of(context).colorScheme.onPrimary),
          label: Text(
            'My projects',
            style: labelStyle.apply(
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

  Widget _buildContact(
      BuildContext context, double screenWidth, TextStyle textStyle) {
    const String email = 'petit.loan1@gmail.com';
    TextStyle labelStyle = (screenWidth < 600)
        ? Theme.of(context).textTheme.subhead
        : Theme.of(context).textTheme.title;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Interested in collaborating? Send me an email.',
          textAlign: TextAlign.center,
          style: textStyle,
        ),
        SizedBox(height: 24.0),
        FlatButton.icon(
          color: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          icon: Icon(
            Icons.email,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          label: Text(
            email,
            style: labelStyle.apply(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          onPressed: () async {
            await Clipboard.setData(new ClipboardData(text: email));
            final snackBar = SnackBar(
              content: Text('Email copied to clipboard', textAlign: TextAlign.center,),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
