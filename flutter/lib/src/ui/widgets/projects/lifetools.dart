import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/size_config.dart';

/// LifeTools project presentation page.
class LifeTools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.network(
          "https://raw.githubusercontent.com/loan-petit/lifetools/media/app_preview.png",
          width: 80 * SizeConfig.widthMultiplier,
        ),
        SizedBox(height: 4 * SizeConfig.heightMultiplier),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style:
                Theme.of(context).textTheme.display4.apply(fontWeightDelta: 3),
            children: <TextSpan>[
              TextSpan(text: "Life"),
              TextSpan(
                text: 'Tools',
                style: Theme.of(context).textTheme.display4.apply(
                      fontWeightDelta: 3,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4 * SizeConfig.heightMultiplier),
        Text(
          "Flutter app for better management of daily habits and goals.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.display2,
        ),
      ],
    );
  }
}
