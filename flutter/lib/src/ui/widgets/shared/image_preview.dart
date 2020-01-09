import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final String uri;

  ImagePreview(this.uri);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imagePreview',
            child: Image.network(uri),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
