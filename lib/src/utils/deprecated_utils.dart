import 'package:material_ui/material_ui.dart';

extension ColorUtils on Color {
  Color withOpacityDeprecated(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withAlpha((255.0 * opacity).round());
  }
}
