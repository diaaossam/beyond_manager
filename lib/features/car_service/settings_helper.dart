import 'package:url_launcher/url_launcher.dart';


class SettingsHelper {
  static Future<void> contactUsWithWhatsApp(
      {required String phoneNumber}) async {
    var whatUrl = 'https://wa.me/$phoneNumber?text=';
    await launchUrl(Uri.parse(whatUrl), mode: LaunchMode.externalApplication);
  }

  static Future<void> contactUsWithPhoneNumber(
      {required String phoneNumber}) async {
    String url = "tel://$phoneNumber";
    await launchUrl(Uri.parse(url));
  }


}
