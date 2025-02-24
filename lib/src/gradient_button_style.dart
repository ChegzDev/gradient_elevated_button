part of '../gradient_elevated_button.dart';

class GradientButtonStyle extends ButtonStyle {
  final WidgetStateProperty<Gradient?>? backgroundGradient;
  @Deprecated('Use `backgroundGradient` instead. '
      'This feature was deprecated after v1.0.5')
  final WidgetStateProperty<Gradient?>? gradient;
  const GradientButtonStyle({
    this.backgroundGradient,
    this.gradient,
    super.foregroundColor,
    super.alignment,
    super.animationDuration,
    super.elevation,
    super.enableFeedback,
    super.fixedSize,
    super.iconColor,
    super.iconSize,
    super.maximumSize,
    super.minimumSize,
    super.mouseCursor,
    super.overlayColor,
    super.padding,
    super.shadowColor,
    super.shape,
    super.side,
    super.splashFactory,
    super.surfaceTintColor,
    super.tapTargetSize,
    super.textStyle,
    super.visualDensity,
    // super.backgroundBuilder,
    // super.foregroundBuilder,
  });

  GradientButtonStyle copyWiths({
    WidgetStateProperty<TextStyle?>? textStyle,
    WidgetStateProperty<Gradient?>? backgroundGradient,
    @Deprecated('Use `backgroundGradient` instead. '
        'This feature was deprecated after v1.0.5')
    WidgetStateProperty<Gradient?>? gradient,
    WidgetStateProperty<Color?>? backgroundColor,
    WidgetStateProperty<Color?>? foregroundColor,
    WidgetStateProperty<Color?>? overlayColor,
    WidgetStateProperty<Color?>? shadowColor,
    WidgetStateProperty<Color?>? surfaceTintColor,
    WidgetStateProperty<double?>? elevation,
    WidgetStateProperty<EdgeInsetsGeometry?>? padding,
    WidgetStateProperty<Size?>? minimumSize,
    WidgetStateProperty<Size?>? fixedSize,
    WidgetStateProperty<Size?>? maximumSize,
    WidgetStateProperty<Color?>? iconColor,
    WidgetStateProperty<double?>? iconSize,
    WidgetStateProperty<BorderSide?>? side,
    WidgetStateProperty<OutlinedBorder?>? shape,
    WidgetStateProperty<MouseCursor?>? mouseCursor,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? tapTargetSize,
    Duration? animationDuration,
    bool? enableFeedback,
    AlignmentGeometry? alignment,
    InteractiveInkFeatureFactory? splashFactory,
    ButtonLayerBuilder? backgroundBuilder,
    ButtonLayerBuilder? foregroundBuilder,
  }) {
    return GradientButtonStyle(
      backgroundGradient:
          backgroundGradient ?? gradient ?? this.backgroundGradient,
      padding: padding ?? this.padding,
      gradient: backgroundGradient ?? gradient ?? this.backgroundGradient,
      overlayColor: overlayColor ?? this.overlayColor,
      mouseCursor: mouseCursor ?? this.mouseCursor,
      minimumSize: minimumSize ?? this.minimumSize,
      maximumSize: maximumSize ?? this.maximumSize,
      iconSize: iconSize ?? this.iconSize,
      iconColor: iconColor ?? this.iconColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      fixedSize: fixedSize ?? this.fixedSize,
      enableFeedback: enableFeedback ?? this.enableFeedback,
      elevation: elevation ?? this.elevation,
      animationDuration: animationDuration ?? this.animationDuration,
      alignment: alignment ?? this.alignment,
      shadowColor: shadowColor ?? this.shadowColor,
      shape: shape ?? this.shape,
      side: side ?? this.side,
      splashFactory: splashFactory ?? this.splashFactory,
      surfaceTintColor: surfaceTintColor ?? this.surfaceTintColor,
      tapTargetSize: tapTargetSize ?? this.tapTargetSize,
      textStyle: textStyle ?? this.textStyle,
      visualDensity: visualDensity ?? this.visualDensity,
      // backgroundBuilder: backgroundBuilder??this.,
      // foregroundBuilder: foregroundBuilder??this.,
    );
  }

  static GradientButtonStyle? ler(
      GradientButtonStyle? a, GradientButtonStyle? b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return GradientButtonStyle(
      textStyle: WidgetStateProperty.lerp<TextStyle?>(
          a?.textStyle, b?.textStyle, t, TextStyle.lerp),
      backgroundGradient: WidgetStateProperty.lerp<Gradient?>(
          a?.backgroundGradient, b?.backgroundGradient, t, Gradient.lerp),
      gradient: WidgetStateProperty.lerp<Gradient?>(
          a?.backgroundGradient, b?.backgroundGradient, t, Gradient.lerp),
      foregroundColor: WidgetStateProperty.lerp<Color?>(
          a?.foregroundColor, b?.foregroundColor, t, Color.lerp),
      overlayColor: WidgetStateProperty.lerp<Color?>(
          a?.overlayColor, b?.overlayColor, t, Color.lerp),
      shadowColor: WidgetStateProperty.lerp<Color?>(
          a?.shadowColor, b?.shadowColor, t, Color.lerp),
      surfaceTintColor: WidgetStateProperty.lerp<Color?>(
          a?.surfaceTintColor, b?.surfaceTintColor, t, Color.lerp),
      elevation: WidgetStateProperty.lerp<double?>(
          a?.elevation, b?.elevation, t, lerpDouble),
      padding: WidgetStateProperty.lerp<EdgeInsetsGeometry?>(
          a?.padding, b?.padding, t, EdgeInsetsGeometry.lerp),
      minimumSize: WidgetStateProperty.lerp<Size?>(
          a?.minimumSize, b?.minimumSize, t, Size.lerp),
      fixedSize: WidgetStateProperty.lerp<Size?>(
          a?.fixedSize, b?.fixedSize, t, Size.lerp),
      maximumSize: WidgetStateProperty.lerp<Size?>(
          a?.maximumSize, b?.maximumSize, t, Size.lerp),
      iconColor: WidgetStateProperty.lerp<Color?>(
          a?.iconColor, b?.iconColor, t, Color.lerp),
      iconSize: WidgetStateProperty.lerp<double?>(
          a?.iconSize, b?.iconSize, t, lerpDouble),
      side: _lerSides(a?.side, b?.side, t),
      shape: WidgetStateProperty.lerp<OutlinedBorder?>(
          a?.shape, b?.shape, t, OutlinedBorder.lerp),
      mouseCursor: t < 0.5 ? a?.mouseCursor : b?.mouseCursor,
      visualDensity: t < 0.5 ? a?.visualDensity : b?.visualDensity,
      tapTargetSize: t < 0.5 ? a?.tapTargetSize : b?.tapTargetSize,
      animationDuration: t < 0.5 ? a?.animationDuration : b?.animationDuration,
      enableFeedback: t < 0.5 ? a?.enableFeedback : b?.enableFeedback,
      alignment: AlignmentGeometry.lerp(a?.alignment, b?.alignment, t),
      splashFactory: t < 0.5 ? a?.splashFactory : b?.splashFactory,
      // backgroundBuilder: t < 0.5 ? a?.backgroundBuilder : b?.backgroundBuilder,
      // foregroundBuilder: t < 0.5 ? a?.foregroundBuilder : b?.foregroundBuilder,
    );
  }

  static WidgetStateProperty<BorderSide?>? _lerSides(
      WidgetStateProperty<BorderSide?>? a,
      WidgetStateProperty<BorderSide?>? b,
      double t) {
    if (a == null && b == null) {
      return null;
    }
    return WidgetStateBorderSide.lerp(a, b, t);
  }

  static GradientButtonStyle fromElevatedButtonStyle(ButtonStyle? style) {
    return GradientButtonStyle(
      // foregroundBuilder: style?.foregroundBuilder,
      // backgroundBuilder: style?.backgroundBuilder,

      backgroundGradient: convertToGradient(style?.backgroundColor),
      gradient: convertToGradient(style?.backgroundColor),
      foregroundColor: style?.foregroundColor,
      side: style?.side,
      alignment: style?.alignment,
      animationDuration: style?.animationDuration,
      elevation: style?.elevation,
      enableFeedback: style?.enableFeedback,
      fixedSize: style?.fixedSize,
      iconColor: style?.iconColor,
      iconSize: style?.iconSize,
      maximumSize: style?.maximumSize,
      minimumSize: style?.minimumSize,
      mouseCursor: style?.mouseCursor,
      overlayColor: style?.overlayColor,
      padding: style?.padding,
      shadowColor: style?.shadowColor,
      shape: style?.shape,
      splashFactory: style?.splashFactory,
      surfaceTintColor: style?.surfaceTintColor,
      tapTargetSize: style?.tapTargetSize,
      textStyle: style?.textStyle,
      visualDensity: style?.visualDensity,
    );
  }

  static WidgetStateProperty<Gradient?>? convertToGradient(
      WidgetStateProperty<Color?>? backgroundColor) {
    if (backgroundColor == null) return null;

    return WidgetStateProperty.resolveWith<Gradient?>(
        (Set<WidgetState> states) {
      // Resolve the color for the current state
      final Color? color = backgroundColor.resolve(states);
      if (color == null) return null;
      // Convert the color to a simple gradient (e.g., single color linear gradient)
      return _gradientFromColor(color);
    });
  }
}
