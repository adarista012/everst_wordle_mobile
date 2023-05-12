import 'dart:math';

import 'package:flutter/material.dart';

class RandomColor {
  Color random() {
    int intValue = Random().nextInt(4);
    if (intValue == 0) return Colors.red;
    if (intValue == 1) return Colors.white;
    if (intValue == 2) return Colors.blue;
    return Colors.yellow;
  }
}
