import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/size_config.dart';

class Link extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  Link({this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    final TextStyle labelTextStyle = (SizeConfig.isMobilePortrait)
        ? Theme.of(context).textTheme.display1
        : Theme.of(context).textTheme.headline;

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 3.0,
            ),
          ),
        ),
        child: Text(
          this.label,
          textAlign: TextAlign.center,
          style: labelTextStyle.apply(
            color: Theme.of(context).colorScheme.primary,
            fontWeightDelta: 2,
          ),
        ),
      ),
    );
  }
}
