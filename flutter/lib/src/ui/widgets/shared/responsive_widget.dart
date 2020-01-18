import 'package:flutter/material.dart';

import 'package:portfolio/src/utils/size_config.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget portraitLayout;
  final Widget landscapeLayout;

  const ResponsiveWidget({
    Key key,
    @required this.portraitLayout,
    this.landscapeLayout,
  })  : assert(portraitLayout != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.isPortrait) {
      return portraitLayout;
    } else {
      return landscapeLayout;
    }
  }
}
