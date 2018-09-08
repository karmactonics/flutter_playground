import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyTextFormView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyTextFormViewState();
  }
}

class MyTextFormViewState extends State<MyTextFormView> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    List<Widget> columnWidget = [
      Expanded(
        child: _scrollableTextField(),
      )
    ];

    if (focusNode != null && focusNode.hasFocus == true) {
      var toolBar = _normalToolBar();
      columnWidget.add(toolBar);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('テキスト入力'),
      ),
      body: Container(
        child: Column(
          children: columnWidget,
        ),
      ),
    );
  }

  Widget _scrollableTextField() {
    // ListViewにいれてあげることで、テキストフォームの高さが広がるに応じてスクロールできる
    return ListView(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.pink[100],
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: TextField(
            decoration:
                InputDecoration(border: InputBorder.none), //テキストフォーム下の下線
            keyboardType: TextInputType.multiline,
            maxLines: null,
            textAlign: TextAlign.left,
            focusNode: this.focusNode,
          ),
        ),
      ],
    );
  }

  Widget _normalToolBar() {
    return Container(
        decoration: BoxDecoration(
            border: BorderDirectional(top: BorderSide(color: Colors.black)),
            color: Colors.grey[200]),
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
              child: Text('完了'),
              onPressed: () {
                focusNode.unfocus();
              },
            )
          ],
        ));
  }
}
