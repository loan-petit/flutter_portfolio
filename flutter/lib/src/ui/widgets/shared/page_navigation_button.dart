import 'package:flutter/material.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle textStyle = (screenWidth < 600)
        ? Theme.of(context).textTheme.subhead
        : Theme.of(context).textTheme.title;

    return FlatButton(
      hoverColor: Colors.transparent,
      child: Column(
        children: <Widget>[
          if (screenWidth > 400)
            Text(
              widget.label,
              style:
                  textStyle.apply(color: Theme.of(context).colorScheme.primary),
            ),
          Icon(
            widget.icon,
            color: Theme.of(context).colorScheme.primary,
            size: (screenWidth < 600) ? 30.0 : 50.0,
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
