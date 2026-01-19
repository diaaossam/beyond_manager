import 'package:url_launcher/url_launcher.dart';

class ContactHelper {





  static Future<void> contactUsWithWhatsApp({
    required String phoneNumber,
  }) async {
    var whatUrl = 'https://wa.me/$phoneNumber?text=';
    await launchUrl(Uri.parse(whatUrl), mode: LaunchMode.externalApplication);
  }

  static Future<void> contactUsWithTelegram({required String telegram}) async {
    await launchUrl(Uri.parse(telegram), mode: LaunchMode.externalApplication);
  }

  static Future<void> contactUsWithPhoneNumber({
    required String phoneNumber,
  }) async {
    String url = "tel://$phoneNumber";
    await launchUrl(Uri.parse(url));
  }

  static Future<void> lunchUrl({required String url}) async {
    await launchUrl(Uri.parse(url));
  }

  static Future<void> openFacebook(String facebookUrl) async {
    await launchUrl(
      Uri.parse(facebookUrl),
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<void> openX(String xUrl) async {
    await launchUrl(Uri.parse(xUrl), mode: LaunchMode.externalApplication);
  }

  static Future<void> openInstagram(String instagramUrl) async {
    await launchUrl(
      Uri.parse(instagramUrl),
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<void> openTikTok(String tikTokUrl) async {
    await launchUrl(Uri.parse(tikTokUrl), mode: LaunchMode.externalApplication);
  }

  static Future<void> openWebsite(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
