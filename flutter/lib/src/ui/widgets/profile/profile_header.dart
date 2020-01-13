import 'package:flutter/material.dart';

import 'package:portfolio/src/app_localizations.dart';
import 'package:portfolio/src/ui/widgets/shared/emphasised_text.dart';
import 'package:portfolio/src/ui/widgets/shared/responsive_widget.dart';
import 'package:portfolio/src/utils/size_config.dart';

/// Header introducing me on the home screen.
class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      portraitLayout: _buildPortraitLayout(context),
      landscapeLayout: _buildLandscapeLayout(context),
    );
  }

  /// Build the layout for a portrait orientation.
  Widget _buildPortraitLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 18 * SizeConfig.imageSizeMultiplier,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/png/profile.png'),
        ),
        SizedBox(height: 4 * SizeConfig.heightMultiplier),
        EmphasisedText(
          text: AppLocalization.of(context).welcome(""),
          style: Theme.of(context).textTheme.display4.apply(
                fontWeightDelta: 3,
              ),
        ),
        SizedBox(height: 8 * SizeConfig.heightMultiplier),
        _buildShortSummary(context)
      ],
    );
  }

  /// Build the layout for a landscape orientation.
  Widget _buildLandscapeLayout(BuildContext context) {
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
                  radius: 12 * SizeConfig.imageSizeMultiplier,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/png/profile.png'),
                ),
              ),
            ),
            Expanded(
              child: EmphasisedText(
                text: AppLocalization.of(context).welcome("\n"),
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.display4.apply(
                      fontWeightDelta: 3,
                    ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10 * SizeConfig.heightMultiplier),
        _buildShortSummary(context),
      ],
    );
  }

  /// Short summary of about me.
  Widget _buildShortSummary(BuildContext context) {
    return EmphasisedText(
      text: AppLocalization.of(context).shortSummary,
      style: Theme.of(context).textTheme.display2,
    );
  }
}
