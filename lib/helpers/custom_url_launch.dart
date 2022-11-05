import 'package:url_launcher/url_launcher.dart';

launchURL(String url) async {
  if (await canLaunchUrl(Uri(path: url))) {
    await launchUrl(Uri(path: url));
  }
}
