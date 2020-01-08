import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/size_config.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final header = RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Theme.of(context).textTheme.display3.apply(fontWeightDelta: 3),
        children: <TextSpan>[
          TextSpan(text: 'Loan '),
          TextSpan(
            text: 'PETIT',
            style: Theme.of(context).textTheme.display3.apply(
                fontWeightDelta: 3,
                color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
          header,
          SizedBox(height: 3 * SizeConfig.heightMultiplier),
          _buildMenuItem(context, Icons.work, 'Projects', '/projects'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, IconData icon, String title, String namedRoute) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, namedRoute);
      },
      child: Container(
        height: 4 * SizeConfig.heightMultiplier,
        padding: EdgeInsets.only(left: 3 * SizeConfig.widthMultiplier),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1 * SizeConfig.widthMultiplier),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(flex: 1, child: Icon(icon)),
            Flexible(
              flex: 8,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.display2,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(right: 3 * SizeConfig.widthMultiplier),
                child: Icon(Icons.navigate_next),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
