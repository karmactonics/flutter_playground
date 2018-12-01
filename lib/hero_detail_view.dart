import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class HeroDetailView extends StatelessWidget {
  final String imageName;
  final String imageTag;

  HeroDetailView(this.imageName, this.imageTag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hero詳細"),
        ),
        body: Container(
          child: Center(
            child: Hero(
              tag: this.imageTag,
              child: Image.asset(
                imageName,
                height: 300.0,
                width: 300.0,
              ),
            ),
          ),
        ));
  }
}
