import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/src/utils/size_config.dart';

import 'package:url_launcher/url_launcher.dart';

/// Page with contact informations and social medias.
class ProfileAdditionalInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle titleTextStyle = (SizeConfig.isMobilePortrait)
        ? Theme.of(context).textTheme.display2
        : Theme.of(context).textTheme.display1;
    final TextStyle labelTextStyle = (SizeConfig.isMobilePortrait)
        ? Theme.of(context).textTheme.display1
        : Theme.of(context).textTheme.headline;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildSocial(context, titleTextStyle),
        SizedBox(height: 5 * SizeConfig.heightMultiplier),
        _buildProjects(context, titleTextStyle, labelTextStyle),
        SizedBox(height: 5 * SizeConfig.heightMultiplier),
        _buildContact(context, titleTextStyle, labelTextStyle),
      ],
    );
  }

  Widget _buildSocial(
    BuildContext context,
    TextStyle titleTextStyle,
  ) {
    double socialIconSize = (SizeConfig.isMobilePortrait)
        ? 7 * SizeConfig.imageSizeMultiplier
        : 5 * SizeConfig.imageSizeMultiplier;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Want to know more about me ? Check out those platforms!',
          textAlign: TextAlign.center,
          style: titleTextStyle,
        ),
        SizedBox(height: 2 * SizeConfig.heightMultiplier),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              hoverColor: Colors.transparent,
              child: Image.asset(
                'assets/social/linkedin.png',
                width: socialIconSize,
                height: socialIconSize,
              ),
              onPressed: () async =>
                  await _launchUrl('https://fr.linkedin.com/in/loanpetit'),
            ),
            SizedBox(width: 1 * SizeConfig.widthMultiplier),
            FlatButton(
              hoverColor: Colors.transparent,
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
    BuildContext context,
    TextStyle titleTextStyle,
    TextStyle labelTextStyle,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'I also have some projects to show you.',
          textAlign: TextAlign.center,
          style: titleTextStyle,
        ),
        SizedBox(height: 2 * SizeConfig.heightMultiplier),
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
            style: labelTextStyle.apply(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/projects");
          },
        ),
      ],
    );
  }

  Widget _buildContact(
    BuildContext context,
    TextStyle titleTextStyle,
    TextStyle labelTextStyle,
  ) {
    const String email = 'petit.loan1@gmail.com';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Interested in collaborating? Send me an email.',
          textAlign: TextAlign.center,
          style: titleTextStyle,
        ),
        SizedBox(height: 2 * SizeConfig.heightMultiplier),
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
            style: labelTextStyle.apply(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          onPressed: () async {
            await Clipboard.setData(new ClipboardData(text: email));
            final snackBar = SnackBar(
              content: Text(
                'Email copied to clipboard',
                textAlign: TextAlign.center,
              ),
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
