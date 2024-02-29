import 'dart:math';

import 'package:flutter/material.dart';

class AppGradients {
  static const linear = LinearGradient(colors: [
    Color.fromRGBO(0, 0, 0, 0.7),
    Color.fromRGBO(0, 0, 0, 1),
  ], stops: [
    0.0,
    100
  ], transform: GradientRotation(1.7));
}
