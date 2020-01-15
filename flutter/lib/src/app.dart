import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:portfolio/src/app_localizations.dart';
import 'package:portfolio/src/router.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/src/ui/app_theme.dart';
import 'package:portfolio/src/ui/widgets/shared/loading_screen.dart';
import 'package:portfolio/src/utils/size_config.dart';

/// The main [Widget] containing the [MaterialApp] definition.
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = Router();

  /// Application's locale used for internationalization.
  Locale _locale;
  bool _localeLoaded = false;

  @override
  void initState() {
    super.initState();

    AppLocalization.fetchLocale().then(_onLocaleChange);
    AppLocalization.onLocaleChange = _onLocaleChange;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppTheme.backgroundColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    if (!_localeLoaded) {
      return LoadingScreen(
        child: Container(color: Theme.of(context).colorScheme.background),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            AppTheme().init();

            return MaterialApp(
              localeResolutionCallback: (deviceLocale, _) {
                if (_locale == null) {
                  AppLocalization.setLocale(deviceLocale, refresh: false);
                  _locale = deviceLocale;
                }
                return _locale;
              },
              localizationsDelegates: [
                const AppLocalizationDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('en', ''),
                const Locale('fr', ''),
              ],
              title: 'Loan PETIT',
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child,
              ),
              debugShowCheckedModeBanner: false,
              theme: AppTheme.themeData,
              initialRoute: '/',
              onGenerateRoute: _router.onGenerateRoute,
            );
          },
        );
      },
    );
  }

  void _onLocaleChange(Locale newLocale) {
    setState(() {
      _localeLoaded = true;
      _locale = newLocale;
    });
  }
}
