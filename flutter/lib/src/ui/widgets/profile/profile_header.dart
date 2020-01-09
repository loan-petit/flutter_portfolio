import 'package:flutter/material.dart';
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
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style:
                Theme.of(context).textTheme.display4.apply(fontWeightDelta: 3),
            children: <TextSpan>[
              TextSpan(text: "Hello, I'm "),
              TextSpan(
                text: 'Loan PETIT',
                style: Theme.of(context).textTheme.display4.apply(
                    fontWeightDelta: 3,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
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
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .display4
                      .apply(fontWeightDelta: 2),
                  children: <TextSpan>[
                    TextSpan(text: 'Hello,\n'),
                    TextSpan(
                      text: "I'm ",
                      style: Theme.of(context).textTheme.display4.apply(
                            fontWeightDelta: 3,
                          ),
                    ),
                    TextSpan(
                      text: 'Loan PETIT',
                      style: Theme.of(context).textTheme.display4.apply(
                          fontWeightDelta: 3,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
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
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Theme.of(context).textTheme.display2,
        children: <TextSpan>[
          TextSpan(text: "I am a "),
          TextSpan(
            text: 'freelance developer',
            style: Theme.of(context)
                .textTheme
                .display2
                .apply(color: Theme.of(context).colorScheme.primary),
          ),
          TextSpan(
              text:
                  ' passionate about innovative, disruptive and ambitious projects.')
        ],
      ),
    );
  }
}
