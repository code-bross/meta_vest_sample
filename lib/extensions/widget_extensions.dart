
import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(16)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }
  Widget flexible() {
    return Flexible(child: this);
  }
  Widget background(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }

  Widget cornerRadius(BorderRadius radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  Widget align([AlignmentGeometry alignment = Alignment.center]) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Widget expanded(){
    return Expanded(child: this);
  }
}
