import 'package:url_launcher/url_launcher.dart';

launchURL(String? url) async {
  if (url == null) return;
  try {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } catch (e) {}
}
