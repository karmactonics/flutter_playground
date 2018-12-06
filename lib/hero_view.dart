import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:playground/hero_detail_view.dart';

class HeroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heroアニメーション"),
      ),
      body: ListView(
        children: <Widget>[
          HeroCell(
            'images/chiri.png',
            'image_chiri',
            'ちりたそ',
            onTap: () {
              transitionDetail(context, 'images/chiri.png', 'image_chiri');
            },
          ),
          Divider(),
          HeroCell(
            "images/noko.png",
            "image_noko",
            "ノコちゃん",
            onTap: () {
              transitionDetail(context, 'images/noko.png', 'image_noko');
            },
          ),
          Divider()
        ],
      ),
    );
  }

  Future transitionDetail(
      BuildContext context, String imageName, String imageTag) async {
    await Navigator.of(context).push(PageRouteBuilder(pageBuilder:
        (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
      return HeroDetailView(imageName, imageTag);
    }));
  }
}

class HeroCell extends StatelessWidget {
  final String imageName;
  final String imageTag;
  final String title;
  final VoidCallback onTap;

  HeroCell(this.imageName, this.imageTag, this.title, {this.onTap});

  @override
  Widget build(BuildContext context) {
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            // Heroクラス
            child: Hero(
              tag: imageTag,
              child: Image.asset(
                imageName,
                width: 80.0,
                height: 80.0,
              ),
            ),
          ),
          Expanded(
            child: Text(this.title),
          )
        ]);
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              // Heroクラス
              child: Hero(
                tag: imageTag,
                child: Image.asset(
                  imageName,
                  width: 80.0,
                  height: 80.0,
                ),
              ),
            ),
            Expanded(
              child: Text(this.title),
            ),
          ],
        ),
      ),
    );
  }
}
