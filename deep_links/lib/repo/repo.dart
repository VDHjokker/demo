import 'package:flutter/services.dart';

class PlatformRepository {
  static const platform = const MethodChannel('flutter.native/helper');
  static const platform2 = const MethodChannel('flutter.native/channel');

  PlatformRepository() {
    initLink();
  }

  Future<String> changeColor(String color) async {
    try {
      final String result = await platform.invokeMethod("changeColor", {
        "color": color,
      });
      print('RESULT -> $result');
      color = result;
    } on PlatformException catch (e) {
      print(e);
    }
    return color;
  }

  Future initLink() async {
    try {
      final String result = await platform2.invokeMethod("initLink", {});
      print('RESULT -> $result');
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
