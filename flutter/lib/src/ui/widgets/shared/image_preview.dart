import 'package:flutter/material.dart';
import 'package:portfolio/src/ui/widgets/shared/loading_screen.dart';

import 'package:portfolio/src/utils/size_config.dart';

/// Show an image at [uri] in a fullscreen preview.
class ImagePreview extends StatelessWidget {
  final String uri;

  ImagePreview(this.uri);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          child: Center(
            child: Hero(
              tag: 'imagePreview',
              child: Image.network(uri),
            ),
          ),
          onTap: () => Navigator.pop(context),
        ),
        GestureDetector(
          child: Container(
            margin: EdgeInsets.all(1 * SizeConfig.widthMultiplier),
            alignment: Alignment.topRight,
            child: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 3 * SizeConfig.textMultiplier,
            ),
          ),
          onTap: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
