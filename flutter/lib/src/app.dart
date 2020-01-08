import 'package:flutter/material.dart';

import 'package:portfolio/src/router.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/src/ui/app_theme.dart';
import 'package:portfolio/src/utils/size_config.dart';

/// The main [Widget] containing the [MaterialApp] definition.
class App extends StatelessWidget {
  final _router = Router();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppTheme.backgroundColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            AppTheme().init();

            return MaterialApp(
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
}
