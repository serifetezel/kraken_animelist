import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double calculateHeight(double value) =>
      //(MediaQuery.of(this).size.height * value) / 783;
MediaQuery.of(this).size.height/value;
  double calculateWidth(double value) =>
      //(MediaQuery.of(this).size.width * value) / 392;
      MediaQuery.of(this).size.width/value;
}