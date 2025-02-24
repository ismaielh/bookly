import 'package:bookly/core/utils/function/custom_awesome_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customAwesomeDialog(
          context, "Cannot launch $url"); // استدعاء الديالوج المخصص
    }
  }
}
