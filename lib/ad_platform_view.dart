import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob_platform_view/firebase_admob_platform_view.dart';

class AdPlatformView extends StatefulWidget {
  @override
  _AdPlatformViewState createState() => _AdPlatformViewState();
}

class _AdPlatformViewState extends State<AdPlatformView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admob Platform View"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        alignment: Alignment.center,
        child: AdBannerView(
          adId: FirebaseAdmobPlatformView.testBannerId,
          adSize: AdSize.custom(300, 80),
        ),
      ),
    );
  }
}
