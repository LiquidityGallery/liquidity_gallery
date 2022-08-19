import 'package:url_launcher/url_launcher.dart';

///URL Launcher simple version
Future<void> hyperlink(String link) async {
  void _launchURL(String a) async =>
      await canLaunch(a) ? await launch(a) : throw 'Could not launch $a';
  _launchURL(link);
}
