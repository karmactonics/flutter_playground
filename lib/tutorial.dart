import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:playground/dot_indicator.dart';

class Tutorial extends StatefulWidget {
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  List<Widget> _pageItems;
  final _controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageItems = [];
    for (var i = 0; i < 7; i++) {
      Widget item = Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Colors.blueGrey, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Text("$i", style: TextStyle(fontSize: 30.0)),
      );
      _pageItems.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height * 0.6;
    double buttonHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
        appBar: AppBar(
          title: Text("チュートリアル風画面"),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: pageHeight,
                child: PageView(
                  children: _pageItems,
                  controller: _controller,
                ),
              ),
              ButtonTheme(
                height: buttonHeight,
                child: FlatButton(
                  child: Text("スキップ"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: DotsIndicator(
                    controller: _controller,
                    itemCount: _pageItems.length,
                    color: Colors.black,
                    selectedColor: Colors.red,
                    onPageSelected: (_) {},
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
