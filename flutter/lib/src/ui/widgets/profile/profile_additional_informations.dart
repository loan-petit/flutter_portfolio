import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/src/app_localizations.dart';

import 'package:portfolio/src/ui/widgets/shared/link.dart';
import 'package:portfolio/src/utils/launch_url.dart';
import 'package:portfolio/src/utils/size_config.dart';

/// Page with contact informations and social medias.
class ProfileAdditionalInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildProjects(context),
        SizedBox(height: 40 * SizeConfig.sizeMultiplier),
        _buildServices(context),
        SizedBox(height: 40 * SizeConfig.sizeMultiplier),
        _buildSocial(context),
      ],
    );
  }

  /// Build layout for the projects part.
  Widget _buildProjects(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          AppLocalization.of(context).projectsLinkIntro,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 15 * SizeConfig.sizeMultiplier),
        Link(
          label: AppLocalization.of(context).projectsLink,
          onTap: () {
            Navigator.pushNamed(context, "/projects");
          },
        ),
      ],
    );
  }

  /// Build layout for the services part.
  Widget _buildServices(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          AppLocalization.of(context).servicesLinkIntro,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 15 * SizeConfig.sizeMultiplier),
        Link(
          label: AppLocalization.of(context).servicesLink,
          onTap: () {
            Navigator.pushNamed(context, "/services");
          },
        ),
      ],
    );
  }

  /// Build layout for the social part.
  Widget _buildSocial(BuildContext context) {
    const String email = "petit.loan1@gmail.com";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          AppLocalization.of(context).socialLinkIntro,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 15 * SizeConfig.sizeMultiplier),
        Link(
          label: email,
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: email));
            final snackBar = SnackBar(
              content: Text(
                AppLocalization.of(context).emailCopiedMessage,
                textAlign: TextAlign.center,
              ),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
        SizedBox(height: 10 * SizeConfig.sizeMultiplier),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Link(
              label: "LinkedIn",
              onTap: () async =>
                  await launchUrl('https://fr.linkedin.com/in/loanpetit'),
            ),
            SizedBox(width: 10 * SizeConfig.sizeMultiplier),
            Link(
              label: "Github",
              onTap: () async =>
                  await launchUrl('https://github.com/loan-petit'),
            ),
          ],
        ),
      ],
    );
  }
}
