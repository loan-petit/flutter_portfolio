import 'package:flutter/material.dart';

import 'package:portfolio/src/utils/size_config.dart';

/// Wrapper around a [FlatButton] indicating the presence of a page under the current one.
///
/// Button's UI react to scroll on page with opacity changes based on [scrollNotifier].
///
/// A click on the button triggers a page change in [PageView] using [pageController].
class PageNavigationButton extends StatefulWidget {
  final ValueNotifier<double> scrollNotifier;
  final String label;
  final IconData icon;
  final PageController pageController;

  const PageNavigationButton({
    Key key,
    this.scrollNotifier,
    this.label,
    @required this.icon,
    @required this.pageController,
  }) : super(key: key);

  @override
  _PageNavigationButtonState createState() => _PageNavigationButtonState();
}

class _PageNavigationButtonState extends State<PageNavigationButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.scrollNotifier != null) {
      return AnimatedBuilder(
        animation: widget.scrollNotifier,
        builder: (context, _) {
          double opacity = (widget.scrollNotifier.value >= 0)
              ? widget.scrollNotifier.value - 1
              : widget.scrollNotifier.value;
          return Opacity(
            opacity: opacity.abs(),
            child: _buildButton(context),
          );
        },
      );
    } else {
      return _buildButton(context);
    }
  }

  Widget _buildButton(BuildContext context) {
    return FlatButton(
      hoverColor: Colors.transparent,
      child: Column(
        children: <Widget>[
          if (SizeConfig.isMobilePortrait == false)
            Text(
              widget.label,
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .apply(color: Theme.of(context).colorScheme.primary),
            ),
          Icon(
            widget.icon,
            color: Theme.of(context).colorScheme.primary,
            size: (SizeConfig.isMobilePortrait)
                ? 8 * SizeConfig.imageSizeMultiplier
                : 3 * SizeConfig.imageSizeMultiplier,
          ),
        ],
      ),
      onPressed: () {
        widget.pageController.animateToPage(
          widget.pageController.page.toInt() + 1,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      },
    );
  }
}
