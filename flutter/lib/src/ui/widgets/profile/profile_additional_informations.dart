import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:portfolio/src/ui/widgets/shared/link.dart';
import 'package:portfolio/src/utils/launch_url.dart';
import 'package:portfolio/src/utils/size_config.dart';

/// Page with contact informations and social medias.
class ProfileAdditionalInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle titleTextStyle = (SizeConfig.isMobilePortrait)
        ? Theme.of(context).textTheme.display2
        : Theme.of(context).textTheme.display1;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildProjects(context, titleTextStyle),
        SizedBox(height: 5 * SizeConfig.heightMultiplier),
        _buildServices(context, titleTextStyle),
        SizedBox(height: 5 * SizeConfig.heightMultiplier),
        _buildSocial(context, titleTextStyle),
      ],
    );
  }

  /// Build layout for the projects part.
  Widget _buildProjects(BuildContext context, TextStyle titleTextStyle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Here are some of the projects I have made.',
          textAlign: TextAlign.center,
          style: titleTextStyle,
        ),
        SizedBox(height: 2 * SizeConfig.heightMultiplier),
        Link(
          label: "My projects",
          onTap: () {
            Navigator.pushReplacementNamed(context, "/projects");
          },
        ),
      ],
    );
  }

  /// Build layout for the services part.
  Widget _buildServices(BuildContext context, TextStyle titleTextStyle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Want to collaborate? Check out my services.",
          textAlign: TextAlign.center,
          style: titleTextStyle,
        ),
        SizedBox(height: 2 * SizeConfig.heightMultiplier),
        Link(
          label: "My services",
          onTap: () {
            Navigator.pushReplacementNamed(context, "/services");
          },
        ),
      ],
    );
  }

  /// Build layout for the social part.
  Widget _buildSocial(
    BuildContext context,
    TextStyle titleTextStyle,
  ) {
    const String email = "petit.loan1@gmail.com";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Let's connect.",
          style: titleTextStyle,
        ),
        SizedBox(height: 2 * SizeConfig.heightMultiplier),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Link(
              label: "LinkedIn",
              onTap: () async =>
                  await launchUrl('https://fr.linkedin.com/in/loanpetit'),
            ),
            SizedBox(width: 1 * SizeConfig.widthMultiplier),
            Link(
              label: "Github",
              onTap: () async =>
                  await launchUrl('https://github.com/loan-petit'),
            ),
          ],
        ),
        SizedBox(height: 2 * SizeConfig.heightMultiplier),
        Link(
          label: email,
          onTap: () async {
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
}
