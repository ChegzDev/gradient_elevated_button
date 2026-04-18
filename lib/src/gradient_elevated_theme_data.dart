part of '../gradient_elevated_button.dart';

/// {@template gradient_button_theme_data_deprecated}
/// DEPRECATED: Use [GradientButtonThemeExtension] with [ThemeData.extensions] instead.
///
/// This widget provides a way to define a global style for [GradientElevatedButton]
/// widgets within the widget tree. It will be removed in a future release.
///
/// Migrate to using [ThemeExtension] in your [ThemeData]:
///
/// ```dart
/// ThemeData(
///   extensions: <ThemeExtension<dynamic>>[
///     GradientButtonThemeExtension(
///       style: ...,
///     ),
///   ],
/// )
/// ```
/// {@endtemplate}
@Deprecated('Use ThemeExtension<GradientButtonThemeExtension> in ThemeData.extensions instead. Will be removed in a future release.')
class GradientButtonThemeData extends InheritedWidget {
  /// The [GradientButtonStyle] data that will be applied to [GradientElevatedButton]s.
  final GradientButtonStyle? data;

  /// Creates a new instance of [GradientButtonThemeData].
  ///
  /// The [data] parameter allows you to pass a [GradientButtonStyle] that will
  /// be used by all [GradientElevatedButton] widgets within this widget's scope.
  /// The [child] parameter is the widget subtree that will inherit this theme.
  const GradientButtonThemeData({super.key, this.data, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  /// A helper method to retrieve the [GradientButtonStyle] from the closest
  /// [GradientButtonThemeData] widget in the widget tree.
  ///
  /// Returns `null` if no [GradientButtonThemeData] is found in the widget tree.
  static GradientButtonStyle? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GradientButtonThemeData>()
        ?.data;
  }
}

/// A [ThemeExtension] for gradient button theming. Use this in ThemeData.extensions.
@immutable
class GradientButtonThemeExtension extends ThemeExtension<GradientButtonThemeExtension> {
  final GradientButtonStyle? style;

  const GradientButtonThemeExtension({this.style});

  @override
  GradientButtonThemeExtension copyWith({GradientButtonStyle? style}) {
    return GradientButtonThemeExtension(
      style: style ?? this.style,
    );
  }

  @override
  GradientButtonThemeExtension lerp(ThemeExtension<GradientButtonThemeExtension>? other, double t) {
    if (other is! GradientButtonThemeExtension) return this;
    return GradientButtonThemeExtension(
      style: GradientButtonStyle.ler(this.style, other.style, t),
    );
  }

  static GradientButtonStyle? of(BuildContext context) {
    final ext = Theme.of(context).extension<GradientButtonThemeExtension>();
    return ext?.style;
  }
}

class GradientButtonTheme extends InheritedTheme {
  /// Create a [ElevatedButtonTheme].
  const GradientButtonTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// The configuration of this theme.
  final GradientElevatedButtonThemeData data;

  /// The closest instance of this class that encloses the given context.
  ///
  /// If there is no enclosing [ElevatedButtonTheme] widget, then
  /// [ThemeData.elevatedButtonTheme] is used.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ElevatedButtonThemeData theme = ElevatedButtonTheme.of(context);
  /// ```
  static GradientElevatedButtonThemeData? of(BuildContext context) {
    final GradientButtonTheme? buttonTheme =
        context.dependOnInheritedWidgetOfExactType<GradientButtonTheme>();
    return buttonTheme?.data ??
        GradientElevatedButtonThemeData(
            style: GradientButtonStyle.fromElevatedButtonStyle(
                Theme.of(context).elevatedButtonTheme.style));
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return GradientButtonTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ElevatedButtonTheme oldWidget) =>
      data.style != oldWidget.data.style;
}

@immutable
class GradientElevatedButtonThemeData with Diagnosticable {
  /// Creates an [GradientElevatedButtonThemeData].
  ///
  /// The [style] may be null.
  const GradientElevatedButtonThemeData({this.style});

  /// Overrides for [ElevatedButton]'s default style.
  ///
  /// Non-null properties or non-null resolved [WidgetStateProperty]
  /// values override the [ButtonStyle] returned by
  /// [ElevatedButton.defaultStyleOf].
  ///
  /// If [style] is null, then this theme doesn't override anything.
  final GradientButtonStyle? style;

  /// Linearly interpolate between two elevated button themes.
  static GradientElevatedButtonThemeData? lerp(
      GradientElevatedButtonThemeData? a,
      GradientElevatedButtonThemeData? b,
      double t) {
    if (identical(a, b)) {
      return a;
    }
    return GradientElevatedButtonThemeData(
      style: GradientButtonStyle.ler(a?.style, b?.style, t),
    );
  }

  @override
  int get hashCode => style.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ElevatedButtonThemeData && other.style == style;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<ButtonStyle>('style', style, defaultValue: null));
  }
}
