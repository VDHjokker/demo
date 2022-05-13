// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:launcher_schema/deeplink.service.dart';
import 'package:launcher_schema/home.dart';
import 'package:launcher_schema/registery.locator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cryptography/cryptography.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Launcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'URL Launcher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
  // setup();

    return MaterialApp(
      title: 'Flutter and Deep Linsk PoC',
      theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              bodySmall: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.blue,
                fontSize: 25.0,
              ),
            ),),
      home: Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Provider<DeepLinkService>(
        create: (context) => DeepLinkService(),
        dispose: (context, bloc) => bloc.dispose(),
        child: HomePage(),
        )
      ),
    );
  }
}
