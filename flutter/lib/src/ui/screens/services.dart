import 'package:flutter/material.dart';

import 'package:portfolio/src/ui/widgets/shared/emphasised_text.dart';
import 'package:portfolio/src/ui/widgets/shared/scaffold/index.dart';
import 'package:portfolio/src/utils/size_config.dart';

/// Details about the services I can provide as a freelancer.
class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String summary = '''My main areas of expertise are:
• Development of mobile and web applications: Flutter, React.
• Back-end development: GraphQL, Prisma, MongoDB.
• DevOps implementation: Docker, GitHub Actions.
• Chatbot development and deployment on voice assistants.
• Advice on the architecture of solutions and technological choices.

My experiences and my adaptability allow me to support you on each step of the implementation of your project, from the idea to the deployment in production.

Do not hesitate to contact me for more information about my services. I would be happy to advise you and meet your needs.

Looking forward to discussing or working with you. :) 
''';

    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            EmphasisedText(
              text: "My *services*",
              style: Theme.of(context).textTheme.display4.apply(
                    fontSizeFactor: 0.8,
                    fontWeightDelta: 3,
                  ),
            ),
            SizedBox(height: 4 * SizeConfig.heightMultiplier),
            EmphasisedText(
              text: summary,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(height: 4 * SizeConfig.heightMultiplier),
            EmphasisedText(
              text: "Daily average rate\n\n*350€*",
              style: Theme.of(context).textTheme.display1.apply(
                    fontSizeFactor: 0.8,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
