import 'package:encryptor/encryptor.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


class HomePage extends StatelessWidget {

 Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithoutJavaScript(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithoutDomStorage(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }
  final String lat = "37.3230";
  final String lng = "-122.0312";
  
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
  

// comgooglemaps://?center=$lat,$lng"
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("URL Launcher"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text("Launch Web Page"),
            onTap: () async {

            var plainText = 'SOME DATA TO ENCRYPT';
            var key = 'Key to encrypt and decrpyt the plain text';

            var encrypted = Encryptor.encrypt(key, plainText);
            var decrypted = Encryptor.decrypt(key, encrypted);

            print("encrypted data:   ---- " + encrypted);
            print("decrypted data:   ---- " + decrypted);

                final Uri uri = Uri(scheme: "https", host: "phantom.app", path: "/ul/v1/connect", 
                queryParameters: {
                  "app_url": "https://nagakingdom.com/",
                  "redirect_link": "localhost://dapp/onPhantomConnected",
                  "dapp_encryption_public_key": encrypted,
                  "cluster": "devnet"
                });
               
                _launchUniversalLinkIos(uri);
            //  _launchInBrowser(toLaunch);

              // if (await canLaunchUrl(url)) {
              //   await launch(url, forceSafariVC: false);
              // } else {
              //   throw 'Could not launch $url';
              // }
            },
          ),
        ],
      ),
    );
  }
}