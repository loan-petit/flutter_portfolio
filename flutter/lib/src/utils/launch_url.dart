import 'package:url_launcher/url_launcher.dart';

/// Launch a web page at [url].
Future<void> launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
