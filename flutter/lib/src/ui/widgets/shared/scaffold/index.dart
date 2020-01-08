import 'package:flutter/material.dart';
import 'package:portfolio/src/ui/widgets/shared/scaffold/drawer.dart';
import 'package:portfolio/src/utils/size_config.dart';

/// Wrapper around [Scaffold] used as screen UI base.
class AppScaffold extends StatefulWidget {
  /// [Scaffold] body which will be wrapped.
  final Widget body;

  AppScaffold({
    @required this.body,
  }) : assert(body != null);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  /// Build the scaffold based on the widget properties and wrap the body
  /// with the UI base.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: (SizeConfig.isPortrait) ? SafeArea(child: AppDrawer()) : null,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Container(
              margin: (orientation == Orientation.landscape)
                  ? EdgeInsets.symmetric(
                      horizontal: 10 * SizeConfig.widthMultiplier)
                  : null,
              child: widget.body,
              alignment: Alignment.topCenter,
            );
          },
        ),
      ),
    );
  }

  /// Create the [Scaffold]'s [AppBar].
  Widget _buildAppBar() {
    TextStyle titleTextStyle = (SizeConfig.isPortrait)
        ? Theme.of(context).textTheme.display2
        : Theme.of(context).textTheme.headline;

    TextStyle actionsTextStyle = Theme.of(context).textTheme.title;

    return AppBar(
      iconTheme:
          new IconThemeData(color: Theme.of(context).colorScheme.onBackground),
      title: FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
        },
        child: RichText(
          text: TextSpan(
            style: titleTextStyle.apply(fontWeightDelta: 3),
            children: <TextSpan>[
              TextSpan(text: 'Loan '),
              TextSpan(
                text: 'PETIT',
                style: titleTextStyle.apply(
                    fontWeightDelta: 3,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
      actions: (SizeConfig.isPortrait == false)
          ? <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/projects', (_) => false);
                },
                child: Text(
                  "Projects",
                  style: actionsTextStyle,
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                    style: actionsTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'EN',
                        style: actionsTextStyle,
                      ),
                      TextSpan(text: ' / '),
                      TextSpan(
                        text: 'FR',
                        style: actionsTextStyle.apply(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                ),
              ),
            ]
          : null,
      elevation: 0,
    );
  }
}
