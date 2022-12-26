import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:udevs_phone_number/udevs_phone_number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _udevsPhoneNumberPlugin = UdevsPhoneNumber();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    await _udevsPhoneNumberPlugin.requestPhonePermission();
    try {
      if (await _udevsPhoneNumberPlugin.hasPhonePermission()) {
        platformVersion =
            await _udevsPhoneNumberPlugin.getPhoneNumber() ?? "No phone number";
      } else {
        await _udevsPhoneNumberPlugin.requestPhonePermission();
        platformVersion =
            await _udevsPhoneNumberPlugin.getPhoneNumber() ?? "No phone number";
      }
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
