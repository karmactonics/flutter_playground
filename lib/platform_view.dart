import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:test_platform_view/test_platform_view.dart';

class PlatformView extends StatefulWidget {
  @override
  _PlatformViewState createState() => _PlatformViewState();
}

class _PlatformViewState extends State<PlatformView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PlatformView"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.red),
        child: Center(
            child: SizedBox(
          width: 100,
          height: 100,
          child:
              // (Platform.isIOS)
              //     ? UiKitView(
              //         viewType: "TestView",
              //         gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
              //           Factory<OneSequenceGestureRecognizer>(() {
              //             return EagerGestureRecognizer();
              //           })
              //         ].toSet(),
              //       )
              //     :
              TestPlatformView(
            onTestViewCreated: () {
              print("created! Hahaha :)");
            },
          ),
        )),
      ),
    );
  }
}
