import 'package:flutter/material.dart';

import 'package:portfolio/src/app_localizations.dart';
import 'package:portfolio/src/ui/widgets/expertise_grid.dart';
import 'package:portfolio/src/ui/widgets/shared/emphasised_text.dart';
import 'package:portfolio/src/ui/widgets/shared/scaffold/index.dart';
import 'package:portfolio/src/utils/size_config.dart';

/// Details about the services I can provide as a freelancer.
class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              EmphasisedText(
                text: AppLocalization.of(context).servicesTitle,
                style: Theme.of(context).textTheme.display2.apply(
                      fontSizeFactor: 0.8,
                      fontWeightDelta: 3,
                    ),
              ),
              SizedBox(height: 6 * SizeConfig.heightMultiplier),
              ExpertiseGrid(),
              SizedBox(height: 6 * SizeConfig.heightMultiplier),
              EmphasisedText(
                text: AppLocalization.of(context).servicesDescription,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.subhead,
              ),
              SizedBox(height: 6 * SizeConfig.heightMultiplier),
              Text(
                AppLocalization.of(context).dailyAverageRate,
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .apply(fontWeightDelta: 2),
              ),
              Text(
                '350€',
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .apply(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
