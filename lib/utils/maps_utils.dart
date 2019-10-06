import 'package:url_launcher/url_launcher.dart';

void openMaps(double latitude, double longitude, String label, Function onError) {
  _openUrl("geo:0,0?q=$latitude,$longitude($label)", onError);
}

void openDirections(double latitude, double longitude, Function onError) {
  _openUrl("google.navigation:q=$latitude,$longitude", onError);
}

void _openUrl(String url, Function onError) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    onError();
  }
}
