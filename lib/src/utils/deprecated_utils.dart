// ignore: deprecated_member_use
import 'package:flutter/material.dart';

extension ColorUtils on Color {
  Color withOpacityDeprecated(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withAlpha((255.0 * opacity).round());
  }
}
