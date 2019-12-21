import 'package:flutter/material.dart';

/// LifeTools project presentation page.
class LifeTools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle textStyle = (screenWidth < 600)
        ? Theme.of(context).textTheme.display2
        : Theme.of(context).textTheme.display3;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.network(
            "https://raw.githubusercontent.com/loan-petit/lifetools/media/app_preview.png"),
        SizedBox(height: 32.0),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: textStyle.apply(fontWeightDelta: 3),
            children: <TextSpan>[
              TextSpan(text: "Life"),
              TextSpan(
                text: 'Tools',
                style: textStyle.apply(
                  fontWeightDelta: 3,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.0),
        Text(
          "Flutter app for better management of daily habits and goals.",
          style: (screenWidth < 600)
              ? Theme.of(context).textTheme.headline
              : Theme.of(context).textTheme.display1,
        ),
      ],
    );
  }
}
