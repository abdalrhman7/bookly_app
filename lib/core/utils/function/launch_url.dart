import 'package:url_launcher/url_launcher.dart';

import 'custom_snackbar.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    try{
      launchUrl(uri);
    }catch (e){
      customSnackBar(context, e.toString());
    }
  }
}
