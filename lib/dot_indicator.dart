import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.grey,
    this.selectedColor: Colors.blue,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.grey`.
  final Color color;

  /// The color of the selected dots.
  ///
  /// Defaults to `Colors.blue`.
  final Color selectedColor;

  // The base size of the dots
  static const double _kDotSize = 10.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 20.0;

  Widget _buildDot(int index) {
    var displayedIndex = controller.page ?? controller.initialPage;

    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: (index == displayedIndex) ? selectedColor : color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize,
            height: _kDotSize,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
