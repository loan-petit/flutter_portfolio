import 'package:flutter/material.dart';
import 'package:portfolio/src/app_localizations.dart';

import 'package:portfolio/src/ui/widgets/shared/emphasised_text.dart';
import 'package:portfolio/src/ui/widgets/shared/scaffold/index.dart';
import 'package:portfolio/src/utils/size_config.dart';

/// Details about the services I can provide as a freelancer.
class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            EmphasisedText(
              text: AppLocalization.of(context).servicesTitle,
              style: Theme.of(context).textTheme.display2.apply(
                    fontSizeFactor: 0.8,
                    fontWeightDelta: 3,
                  ),
            ),
            SizedBox(height: 4 * SizeConfig.heightMultiplier),
            EmphasisedText(
              text: AppLocalization.of(context).servicesDescription,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.subhead,
            ),
            Divider(
              height: 6 * SizeConfig.heightMultiplier,
              indent: 30 * SizeConfig.widthMultiplier,
              endIndent: 30 * SizeConfig.widthMultiplier,
              thickness: 2,
              color: Theme.of(context).colorScheme.primary,
            ),
            EmphasisedText(
              text: AppLocalization.of(context).dailyAverageRate + '\n*350€*',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      ),
    );
  }
}
