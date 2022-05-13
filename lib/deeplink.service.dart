

import 'dart:async';

import 'package:flutter/services.dart';

abstract class Service {
  void dispose();
}

class DeepLinkService extends Service {

    //Event Channel creation
  static const stream = const EventChannel('mydapp.flutter.on.phantom/events');

  //Method channel creation
  static const platform = const MethodChannel('mydapp.flutter.on.phantom/channel');

  StreamController<String> _stateController = StreamController();

  Stream<String> get state => _stateController.stream;

  Sink<String> get stateSink => _stateController.sink;

  @override
  void dispose() {
    _stateController.close();
  }

  void  _onRedirected(Object uri) {
    // stateSink.add(uri);
    print(uri);
  }

    //Adding the listener into contructor
  DeepLinkService() {
    print("object running");
    //Checking application start by deep link
    startUri().then((o) {
      print(o);
      _onRedirected(o);
    });
    //Checking broadcast stream, if deep link was clicked in opened appication
    stream.receiveBroadcastStream().listen((d) => _onRedirected(d));
  }

  Future<String> startUri() async {
    try {
      return platform.invokeMethod('initialLink');
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }

}