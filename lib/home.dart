import 'dart:typed_data';

import 'package:bs58/bs58.dart';
import 'package:cryptography/cryptography.dart';
import 'package:flutter/material.dart';
import 'package:launcher_schema/deeplink.service.dart';
import 'package:launcher_schema/registery.locator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  Future<void> _launchUniversalLinkIos(Uri url) async {
    // var decrypted = Encryptor.decrypt(key, encrypted);

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

  @override
  Widget build(BuildContext context) {
    DeepLinkService service = Provider.of<DeepLinkService>(context);
    return StreamBuilder<Object>(
      stream: service.state,
      builder: (context, snapshot) {
        return Center(
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   const Padding(padding: EdgeInsets.all(16.0)),
                    ElevatedButton(
                      onPressed: () async {        
                         final algorithm = X25519();
    
                        // Alice chooses her key pair
                        final aliceKeyPair = await algorithm.newKeyPair();
    
                        final localKeyPair = await aliceKeyPair.extractPublicKey();
                        var dapp_encryption_public_key =  Uint8List.fromList(localKeyPair.bytes);
                        print(base58.encode(dapp_encryption_public_key));
    
                      final Uri toLaunch1 = Uri(
                          scheme: 'https',
                          host: 'phantom.app',
                          path: 'ul/v1/connect',
                          queryParameters: {
                            "app_url": "https://dev.nagakingdom.com",
                            "dapp_encryption_public_key": base58.encode(dapp_encryption_public_key),
                            "redirect_link": "poc://deeplink.flutter.dev",
                            "cluster": "devnet"
                          });
    
                         _launchUniversalLinkIos(toLaunch1);
                      },
                      child: const Text(
                          'Launch a universal link, Phantom Wallet Connection'),
                    ),
                    
                  ],
                ),
        );
      }
    );
  }
}
