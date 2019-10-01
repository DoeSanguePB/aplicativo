import 'package:flutter/material.dart';

class TextBlack extends Text {
  final String text;

  TextBlack(this.text) : super(text, style: TextStyle(color: Colors.black));
}