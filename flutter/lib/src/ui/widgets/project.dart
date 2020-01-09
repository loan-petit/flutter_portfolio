import 'package:flutter/material.dart';
import 'package:portfolio/src/ui/widgets/shared/image_preview.dart';
import 'package:portfolio/src/ui/widgets/shared/link.dart';
import 'package:portfolio/src/ui/widgets/shared/responsive_widget.dart';
import 'package:portfolio/src/utils/launch_url.dart';
import 'package:portfolio/src/utils/size_config.dart';

/// Presentation of a project with its [description] and useful links.
///
/// The [name] must be specified as a [List<TextSpan>] to allow custom styling with [RichText].
///
/// Use [previewUri], [demoUri] and [githubUri] to make the presentation more concrete.
class Project extends StatelessWidget {
  final List<TextSpan> name;
  final String description;

  final String previewUri;
  final String demoUri;
  final String githubUri;

  Project({
    @required this.name,
    @required this.description,
    @required this.previewUri,
    @required this.demoUri,
    @required this.githubUri,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style:
                Theme.of(context).textTheme.display3.apply(fontWeightDelta: 3),
            children: this.name,
          ),
        ),
        SizedBox(height: 4 * SizeConfig.heightMultiplier),
        Text(
          this.description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.display1,
        ),
        SizedBox(height: 4 * SizeConfig.heightMultiplier),
        ResponsiveWidget(
          portraitLayout: _buildPortraitLinks(context),
          landscapeLayout: _buildLandscapeLinks(context),
        ),
      ],
    );
  }

  Widget _buildPortraitLinks(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Link(
          label: "Show preview",
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ImagePreview(this.previewUri)),
          ),
        ),
        SizedBox(height: 1 * SizeConfig.heightMultiplier),
        Link(
          label: "GitHub",
          onTap: () async => await launchUrl(this.githubUri),
        ),
        SizedBox(height: 1 * SizeConfig.heightMultiplier),
        Link(
          label: "Try it out",
          onTap: () async => await launchUrl(this.demoUri),
        ),
      ],
    );
  }

  Widget _buildLandscapeLinks(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Link(
          label: "Show preview",
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ImagePreview(this.previewUri)),
          ),
        ),
        SizedBox(width: 10 * SizeConfig.widthMultiplier),
        Link(
          label: "Try it out",
          onTap: () async => await launchUrl(this.demoUri),
        ),
        SizedBox(width: 10 * SizeConfig.widthMultiplier),
        Link(
          label: "GitHub",
          onTap: () async => await launchUrl(this.githubUri),
        ),
      ],
    );
  }
}
