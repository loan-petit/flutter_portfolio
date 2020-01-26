import 'package:flutter/material.dart';

import 'package:portfolio/src/app_localizations.dart';
import 'package:portfolio/src/ui/widgets/shared/emphasised_text.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      drawer: (SizeConfig.isPortrait) ? SafeArea(child: AppDrawer()) : null,
      body: SafeArea(
        child: Container(
          margin: (!SizeConfig.isPortrait)
              ? EdgeInsets.symmetric(
                  horizontal: SizeConfig.bodyHorizontalMargin)
              : null,
          child: Padding(
              padding: EdgeInsets.all(3 * SizeConfig.heightMultiplier),
              child: widget.body),
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }

  /// Create the [Scaffold]'s [AppBar].
  Widget _buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      leading: (SizeConfig.isPortrait)
          ? IconButton(
              alignment: Alignment.center,
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
              icon: Icon(
                Icons.menu,
                size: 2.5 * SizeConfig.textMultiplier,
              ),
            )
          : null,
      title: FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
        },
        child: EmphasisedText(
          text: AppLocalization.of(context).title,
          style: Theme.of(context).textTheme.title.apply(fontWeightDelta: 2),
        ),
      ),
      actions: (SizeConfig.isPortrait == false)
          ? <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/services', (_) => false);
                },
                child: Text(
                  AppLocalization.of(context).servicesLink,
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/projects', (_) => false);
                },
                child: Text(
                  AppLocalization.of(context).projectsLink,
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              FlatButton(
                onPressed: () async {
                  if (AppLocalization.locale.languageCode == "en") {
                    await AppLocalization.setLocale(Locale("fr", ""));
                  } else {
                    await AppLocalization.setLocale(Locale("en", ""));
                  }
                  setState(() {
                    // Rerender with the new localization.
                  });
                },
                child: EmphasisedText(
                  text: (AppLocalization.locale.languageCode == "en")
                      ? "*EN* / FR"
                      : "EN / *FR*",
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
            ]
          : null,
      elevation: 0,
    );
  }
}
