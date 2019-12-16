import 'package:flutter/material.dart';

class ScrollNotifyingPageView extends StatefulWidget {
  final Axis scrollDirection;
  final bool pageSnapping;
  final ValueNotifier<double> notifier;
  final PageController controller;
  final List<Widget> children;

  const ScrollNotifyingPageView({
    Key key,
    this.scrollDirection,
    this.pageSnapping,
    @required this.notifier,
    @required this.controller,
    @required this.children,
  }) : super(key: key);

  @override
  _ScrollNotifyingPageViewState createState() =>
      _ScrollNotifyingPageViewState();
}

class _ScrollNotifyingPageViewState extends State<ScrollNotifyingPageView> {
  int _previousPage;

  void _onScroll() {
    if (widget.controller.page.toInt() == widget.controller.page) {
      _previousPage = widget.controller.page.toInt();
    }
    widget.notifier?.value = widget.controller.page - _previousPage;
  }

  @override
  void initState() {
    super.initState();

    widget.controller..addListener(_onScroll);
    _previousPage = widget.controller.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: widget.scrollDirection,
      pageSnapping: widget.pageSnapping,
      controller: widget.controller,
      children: widget.children,
    );
  }
}
