import 'package:flutter/material.dart';

import 'package:portfolio/src/app_localizations.dart';
import 'package:portfolio/src/utils/size_config.dart';

/// Grid detailing my expertises.
class ExpertiseGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: _buildGridItem(
                  context,
                  iconData: Icons.web,
                  title: AppLocalization.of(context)
                      .applicationDevelopmentExpertiseTitle,
                  subtitle: AppLocalization.of(context)
                      .applicationDevelopmentExpertiseSubtitle,
                ),
              ),
              SizedBox(width: 4 * SizeConfig.widthMultiplier),
              Expanded(
                child: _buildGridItem(
                  context,
                  iconData: Icons.widgets,
                  title: AppLocalization.of(context).devopsExpertiseTitle,
                  subtitle: AppLocalization.of(context).devopsExpertiseSubtitle,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4 * SizeConfig.heightMultiplier),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: _buildGridItem(
                  context,
                  iconData: Icons.developer_mode,
                  title: AppLocalization.of(context)
                      .backendDevelopmentExpertiseTitle,
                  subtitle: AppLocalization.of(context)
                      .backendDevelopmentExpertiseSubtitle,
                ),
              ),
              SizedBox(width: 4 * SizeConfig.widthMultiplier),
              Expanded(
                child: _buildGridItem(
                  context,
                  iconData: Icons.question_answer,
                  title: AppLocalization.of(context)
                      .chatbotDevelopmentExpertiseTitle,
                  subtitle: AppLocalization.of(context)
                      .chatbotDevelopmentExpertiseSubtitle,
                ),
              ),
              if (!SizeConfig.isPortrait)
                SizedBox(width: 3 * SizeConfig.heightMultiplier),
              if (!SizeConfig.isPortrait)
                Expanded(
                  child: _buildGridItem(
                    context,
                    iconData: Icons.group,
                    title: AppLocalization.of(context).consultingExpertiseTitle,
                    subtitle:
                        AppLocalization.of(context).consultingExpertiseSubtitle,
                  ),
                ),
            ],
          ),
        ),
        if (SizeConfig.isPortrait)
          SizedBox(height: 3 * SizeConfig.heightMultiplier),
        if (SizeConfig.isPortrait)
          _buildGridItem(
            context,
            iconData: Icons.group,
            title: AppLocalization.of(context).consultingExpertiseTitle,
            subtitle: AppLocalization.of(context).consultingExpertiseSubtitle,
          ),
      ],
    );
  }

  /// Build a grid item describing one expertise.
  Widget _buildGridItem(
    BuildContext context, {
    IconData iconData,
    String title,
    String subtitle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 3 * SizeConfig.textMultiplier,
          color: Theme.of(context).colorScheme.primary,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6.apply(fontWeightDelta: 2),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
