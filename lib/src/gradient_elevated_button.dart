part of '../gradient_elevated_button.dart';

/// A custom Material Design "gradient elevated button".
///
/// Use gradient elevated buttons to enhance visual appeal in
/// flat layouts or to add emphasis to key actions. Gradient buttons
/// are especially suitable for modern designs or vibrant themes.
///
/// A gradient elevated button displays a label [child] on a [Material]
/// widget with a gradient-filled background. The button's elevation increases
/// when pressed. The gradient is specified using the [gradient] parameter,
/// and the label's [Text] and [Icon] widgets use the [GradientButtonStyle.foregroundColor].
///
/// This button's style can be customized using its [style] parameter.
/// A consistent style for all gradient elevated buttons in a subtree
/// can be applied using a custom theme.
///
/// If [onPressed] and [onLongPress] callbacks are null, the button will be disabled.
class GradientElevatedButton extends GradientButtonStyleButton {
  /// Create an GradientElevatedButton.
  const GradientElevatedButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior,
    super.statesController,
    required super.child,
    super.iconAlignment,
  });

  /// Create an gradient elevated button from a pair of widgets that serve as the button's
  /// [icon] and [label].
  ///
  /// The icon and label are arranged in a row and padded by 12 logical pixels
  /// at the start, and 16 at the end, with an 8 pixel gap in between.
  ///
  /// If [icon] is null, will create an [GradientElevatedButton] instead.
  factory GradientElevatedButton.icon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    GradientButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    WidgetStatesController? statesController,
    Widget? icon,
    required Widget label,
    IconAlignment iconAlignment = IconAlignment.start,
  }) {
    if (icon == null) {
      return GradientElevatedButton(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        statesController: statesController,
        // iconAlignment: iconAlignment,
        child: label,
      );
    }
    return _GradientElevatedButtonWithIcon(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus ?? false,
      clipBehavior: clipBehavior ?? Clip.none,
      statesController: statesController,
      icon: icon,
      label: label,
      iconAlignment: iconAlignment,
    );
  }

  /// A static convenience method that constructs an elevated button
  /// [GradientButtonStyle] given simple values.
  ///
  /// The [foregroundColor] and [disabledForegroundColor] colors are used
  /// to create a [WidgetStateProperty] [GradientButtonStyle.foregroundColor], and
  /// a derived [GradientButtonStyle.overlayColor] if [overlayColor] isn't specified.
  ///
  /// If [overlayColor] is specified and its value is [Colors.transparent]
  /// then the pressed/focused/hovered highlights are effectively defeated.
  /// Otherwise a [WidgetStateProperty] with the same opacities as the
  /// default is created.
  ///
  /// The [backgroundGradient] and [disabledBackgroundGradient] gradients are
  /// used to create a [WidgetStateProperty] [GradientButtonStyle.backgroundGradient].
  ///
  /// Similarly, the [enabledMouseCursor] and [disabledMouseCursor]
  /// parameters are used to construct [GradientButtonStyle.mouseCursor].
  ///
  /// The [iconColor], [disabledIconColor] are used to construct
  /// [GradientButtonStyle.iconColor] and [iconSize] is used to construct
  /// [GradientButtonStyle.iconSize].
  ///
  /// The button's elevations are defined relative to the [elevation]
  /// parameter. The disabled elevation is the same as the parameter
  /// value, [elevation] + 2 is used when the button is hovered
  /// or focused, and elevation + 6 is used when the button is pressed.
  ///
  /// All of the other parameters are either used directly or used to
  /// create a [WidgetStateProperty] with a single value for all
  /// states.
  ///
  /// All parameters default to null, by default this method returns
  /// a [GradientButtonStyle] that doesn't override anything.
  ///
  /// For example, to override the default text and icon colors for an
  /// [GradientElevatedButton], as well as its overlay color, with all of the
  /// standard opacity adjustments for the pressed, focused, and
  /// hovered states, one could write:
  ///
  /// ```dart
  /// GradientElevatedButton(
  ///   style: GradientElevatedButton.styleFrom(
  ///     foregroundColor: Colors.green
  ///   ),
  ///   onPressed: () {
  ///     // ...
  ///   },
  ///   child: const Text('Jump'),
  /// ),
  /// ```
  ///
  /// And to change the gradient colors:
  ///
  /// ```dart
  /// ElevatedButton(
  ///   style: ElevatedButton.styleFrom(
  ///   backgroundGradient: const LinearGradient(
  ///    colors: [Colors.blue,Colors.green],
  ///    begin: Alignment.centerLeft,
  ///    end: Alignment.centerRight,
  ///   ),
  ///   onPressed: () {
  ///     // ...
  ///   },
  ///   child: const Text('Meow'),
  /// ),
  /// ```
  ///
  static GradientButtonStyle styleFrom({
    Color? foregroundColor,
    @Deprecated('Use [backgroundGradient] instead. '
        'This feature was deprecated after v1.0.5')
    Gradient? gradient,
    Gradient? backgroundGradient,
    Color? disabledForegroundColor,
    Gradient? disabledBackgroundGradient,
    @Deprecated('Use `disabledBackgroundGradient` instead. '
        'This feature was deprecated after v1.0.5')
    Color? disabledBackgroundColor,
    Color? shadowColor,
    Color? surfaceTintColor,
    Color? iconColor,
    double? iconSize,
    Color? disabledIconColor,
    Color? overlayColor,
    double? elevation,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Size? fixedSize,
    Size? maximumSize,
    BorderSide? side,
    OutlinedBorder? shape,
    MouseCursor? enabledMouseCursor,
    MouseCursor? disabledMouseCursor,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? tapTargetSize,
    Duration? animationDuration,
    bool? enableFeedback,
    AlignmentGeometry? alignment,
    InteractiveInkFeatureFactory? splashFactory,
    // ButtonLayerBuilder? backgroundBuilder,
    // ButtonLayerBuilder? foregroundBuilder,
  }) {
    final WidgetStateProperty<Color?>? overlayColorProp =
        switch ((foregroundColor, overlayColor)) {
      (null, null) => null,
      (_, Color(a: 0.0)) => WidgetStatePropertyAll<Color?>(overlayColor),
      (_, final Color color) ||
      (final Color color, _) =>
        WidgetStateProperty<Color?>.fromMap(
          <WidgetState, Color?>{
            WidgetState.pressed: color.withOpacityDeprecated(0.1),
            WidgetState.hovered: color.withOpacityDeprecated(0.08),
            WidgetState.focused: color.withOpacityDeprecated(0.1),
          },
        ),
    };

    WidgetStateProperty<double>? elevationValue;
    if (elevation != null) {
      elevationValue = WidgetStateProperty<double>.fromMap(
        <WidgetStatesConstraint, double>{
          WidgetState.disabled: 0,
          WidgetState.pressed: elevation + 6,
          WidgetState.hovered: elevation + 4,
          WidgetState.focused: elevation + 4,
          WidgetState.any: elevation,
        },
      );
    }

    return GradientButtonStyle(
      textStyle: WidgetStatePropertyAll<TextStyle?>(textStyle),
      backgroundGradient: GradientButtonStyleButton.defaultGradient(
          backgroundGradient ?? gradient, disabledBackgroundGradient),
      gradient: GradientButtonStyleButton.defaultGradient(
          backgroundGradient ?? gradient, disabledBackgroundGradient),
      // backgroundColor: GradientButtonStyleButton.defaultColor(backgroundColor, disabledBackgroundColor),
      foregroundColor: GradientButtonStyleButton.defaultColor(
          foregroundColor, disabledForegroundColor),
      overlayColor: overlayColorProp,
      shadowColor: GradientButtonStyleButton.allOrNull<Color>(shadowColor),
      surfaceTintColor:
          GradientButtonStyleButton.allOrNull<Color>(surfaceTintColor),
      iconColor:
          GradientButtonStyleButton.defaultColor(iconColor, disabledIconColor),
      iconSize: GradientButtonStyleButton.allOrNull<double>(iconSize),
      elevation: elevationValue,
      padding: GradientButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
      minimumSize: GradientButtonStyleButton.allOrNull<Size>(minimumSize),
      fixedSize: GradientButtonStyleButton.allOrNull<Size>(fixedSize),
      maximumSize: GradientButtonStyleButton.allOrNull<Size>(maximumSize),
      side: GradientButtonStyleButton.allOrNull<BorderSide>(side),
      shape: GradientButtonStyleButton.allOrNull<OutlinedBorder>(shape),
      mouseCursor: WidgetStateProperty<MouseCursor?>.fromMap(
        <WidgetStatesConstraint, MouseCursor?>{
          WidgetState.disabled: disabledMouseCursor,
          WidgetState.any: enabledMouseCursor,
        },
      ),
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
      alignment: alignment,
      splashFactory: splashFactory,
      // backgroundBuilder: backgroundBuilder,
      // foregroundBuilder: foregroundBuilder,
    );
  }

  /// Defines the button's default appearance.
  ///
  /// The button [child]'s [Text] and [Icon] widgets are rendered with
  /// the [GradientButtonStyle]'s foreground color. The button's [InkWell] adds
  /// the style's overlay color when the button is focused, hovered,
  /// or pressed. The button's background gradient becomes its [Material]
  /// gradient.
  ///
  /// All of the GradientButtonStyle's defaults appear below. In this list,
  /// "Theme.foo" is shorthand for `Theme.of(context).foo`. Color
  /// scheme values like "onSurface(0.38)" are shorthand for
  /// `onSurface.withOpacity(0.38)`. [WidgetStateProperty] valued
  /// properties that are not followed by a sublist have the same
  /// value for all states, otherwise the values are as specified for
  /// each state, and "others" means all other states.
  ///
  /// {@template flutter.material.gradient_elevated_button.default_font_size}
  /// The "default font size" below refers to the font size specified in the
  /// [defaultStyleOf] method (or 14.0 if unspecified), scaled by the
  /// `MediaQuery.textScalerOf(context).scale` method. The names of the
  /// EdgeInsets constructors and `EdgeInsetsGeometry.lerp` have been abbreviated
  /// for readability.
  /// {@endtemplate}
  ///
  /// The color of the [GradientButtonStyle.textStyle] is not used; the
  /// [GradientButtonStyle.foregroundColor] color is used instead.
  ///
  /// ## Material 2 defaults
  ///
  /// * `textStyle` - Theme.textTheme.button
  /// * `backgroundGradient`
  ///   * disabled - Theme.colorScheme.onSurface(0.12).asGradient
  ///   * others - Theme.colorScheme.primary.asGradient
  /// * `foregroundColor`
  ///   * disabled - Theme.colorScheme.onSurface(0.38)
  ///   * others - Theme.colorScheme.onPrimary
  /// * `overlayColor`
  ///   * hovered - Theme.colorScheme.onPrimary(0.08)
  ///   * focused or pressed - Theme.colorScheme.onPrimary(0.12)
  /// * `shadowColor` - Theme.shadowColor
  /// * `elevation`
  ///   * disabled - 0
  ///   * default - 2
  ///   * hovered or focused - 4
  ///   * pressed - 8
  /// * `padding`
  ///   * `default font size <= 14` - horizontal(16)
  ///   * `14 < default font size <= 28` - lerp(horizontal(16), horizontal(8))
  ///   * `28 < default font size <= 36` - lerp(horizontal(8), horizontal(4))
  ///   * `36 < default font size` - horizontal(4)
  /// * `minimumSize` - Size(64, 36)
  /// * `fixedSize` - null
  /// * `maximumSize` - Size.infinite
  /// * `side` - null
  /// * `shape` - RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
  /// * `mouseCursor`
  ///   * disabled - SystemMouseCursors.basic
  ///   * others - SystemMouseCursors.click
  /// * `visualDensity` - theme.visualDensity
  /// * `tapTargetSize` - theme.materialTapTargetSize
  /// * `animationDuration` - kThemeChangeDuration
  /// * `enableFeedback` - true
  /// * `alignment` - Alignment.center
  /// * `splashFactory` - InkRipple.splashFactory
  ///
  /// The default padding values for the [GradientElevatedButton.icon] factory are slightly different:
  ///
  /// * `padding`
  ///   * `default font size <= 14` - start(12) end(16)
  ///   * `14 < default font size <= 28` - lerp(start(12) end(16), horizontal(8))
  ///   * `28 < default font size <= 36` - lerp(horizontal(8), horizontal(4))
  ///   * `36 < default font size` - horizontal(4)
  ///
  /// The default value for `side`, which defines the appearance of the button's
  /// outline, is null. That means that the outline is defined by the button
  /// shape's [OutlinedBorder.side]. Typically the default value of an
  /// [OutlinedBorder]'s side is [BorderSide.none], so an outline is not drawn.
  ///
  /// ## Material 3 defaults
  ///
  /// If [ThemeData.useMaterial3] is set to true, the following defaults will
  /// be used:
  ///
  /// * `textStyle` - Theme.textTheme.labelLarge
  /// * `backgroundGradient`
  ///   * disabled - Theme.colorScheme.onSurface(0.12).asGradient
  ///   * others - Theme.colorScheme.surfaceContainerLow.asGradient
  /// * `foregroundColor`
  ///   * disabled - Theme.colorScheme.onSurface(0.38)
  ///   * others - Theme.colorScheme.primary
  /// * `overlayColor`
  ///   * hovered - Theme.colorScheme.primary(0.08)
  ///   * focused or pressed - Theme.colorScheme.primary(0.1)
  /// * `shadowColor` - Theme.colorScheme.shadow
  /// * `surfaceTintColor` - Colors.transparent
  /// * `elevation`
  ///   * disabled - 0
  ///   * default - 1
  ///   * hovered - 3
  ///   * focused or pressed - 1
  /// * `padding`
  ///   * `default font size <= 14` - horizontal(24)
  ///   * `14 < default font size <= 28` - lerp(horizontal(24), horizontal(12))
  ///   * `28 < default font size <= 36` - lerp(horizontal(12), horizontal(6))
  ///   * `36 < default font size` - horizontal(6)
  /// * `minimumSize` - Size(64, 40)
  /// * `fixedSize` - null
  /// * `maximumSize` - Size.infinite
  /// * `side` - null
  /// * `shape` - StadiumBorder()
  /// * `mouseCursor`
  ///   * disabled - SystemMouseCursors.basic
  ///   * others - SystemMouseCursors.click
  /// * `visualDensity` - Theme.visualDensity
  /// * `tapTargetSize` - Theme.materialTapTargetSize
  /// * `animationDuration` - kThemeChangeDuration
  /// * `enableFeedback` - true
  /// * `alignment` - Alignment.center
  /// * `splashFactory` - Theme.splashFactory
  ///
  /// For the [GradientElevatedButton.icon] factory, the start (generally the left) value of
  /// [GradientButtonStyle.padding] is reduced from 24 to 16.
  @override
  GradientButtonStyle defaultStyleOf(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Theme.of(context).useMaterial3
        ? _GradientElevatedButtonDefaultsM3(context)
        : styleFrom(
            backgroundGradient: _basicGradient(colorScheme),
            disabledBackgroundGradient: _basicDisabledGradient(colorScheme),
            // backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            // disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
            disabledIconColor:
                colorScheme.onSurface.withOpacityDeprecated(0.38),
            disabledForegroundColor:
                colorScheme.onSurface.withOpacityDeprecated(0.38),
            shadowColor: theme.shadowColor,
            elevation: 2,
            textStyle: theme.textTheme.labelLarge,
            padding: _scaledPadding(context),
            minimumSize: const Size(64, 36),
            maximumSize: Size.infinite,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            enabledMouseCursor: SystemMouseCursors.click,
            disabledMouseCursor: SystemMouseCursors.basic,
            visualDensity: theme.visualDensity,
            tapTargetSize: theme.materialTapTargetSize,
            animationDuration: kThemeChangeDuration,
            enableFeedback: true,
            alignment: Alignment.center,
            splashFactory: InkRipple.splashFactory,
          );
  }

  /// Returns the [GradientElevatedButtonThemeData.style] of the closest
  /// [GradientElevatedButtonTheme] ancestor.
  @override
  GradientButtonStyle? themeStyleOf(BuildContext context) {
    return GradientButtonTheme.of(context)?.style;
  }
}

EdgeInsetsGeometry _scaledPadding(BuildContext context) {
  final ThemeData theme = Theme.of(context);
  final double padding1x = theme.useMaterial3 ? 24.0 : 16.0;
  final double defaultFontSize = theme.textTheme.labelLarge?.fontSize ?? 14.0;
  final double effectiveTextScale =
      MediaQuery.textScalerOf(context).scale(defaultFontSize) / 14.0;

  return GradientButtonStyleButton.scaledPadding(
    EdgeInsets.symmetric(horizontal: padding1x),
    EdgeInsets.symmetric(horizontal: padding1x / 2),
    EdgeInsets.symmetric(horizontal: padding1x / 2 / 2),
    effectiveTextScale,
  );
}

class _GradientElevatedButtonWithIcon extends GradientElevatedButton {
  _GradientElevatedButtonWithIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    bool? autofocus,
    super.clipBehavior,
    super.statesController,
    required Widget icon,
    required Widget label,
    super.iconAlignment,
  }) : super(
          autofocus: autofocus ?? false,
          child: _GradientElevatedButtonWithIconChild(
            icon: icon,
            label: label,
            buttonStyle: style,
            iconAlignment: iconAlignment,
          ),
        );

  @override
  GradientButtonStyle defaultStyleOf(BuildContext context) {
    final bool useMaterial3 = Theme.of(context).useMaterial3;
    final GradientButtonStyle buttonStyle = super.defaultStyleOf(context);
    final double defaultFontSize =
        buttonStyle.textStyle?.resolve(const <WidgetState>{})?.fontSize ?? 14.0;
    final double effectiveTextScale =
        MediaQuery.textScalerOf(context).scale(defaultFontSize) / 14.0;

    final EdgeInsetsGeometry scaledPadding = useMaterial3
        ? GradientButtonStyleButton.scaledPadding(
            const EdgeInsetsDirectional.fromSTEB(16, 0, 24, 0),
            const EdgeInsetsDirectional.fromSTEB(8, 0, 12, 0),
            const EdgeInsetsDirectional.fromSTEB(4, 0, 6, 0),
            effectiveTextScale,
          )
        : GradientButtonStyleButton.scaledPadding(
            const EdgeInsetsDirectional.fromSTEB(12, 0, 16, 0),
            const EdgeInsets.symmetric(horizontal: 8),
            const EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
            effectiveTextScale,
          );
    return buttonStyle.copyWiths(
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(scaledPadding),
    );
  }
}

class _GradientElevatedButtonWithIconChild extends StatelessWidget {
  const _GradientElevatedButtonWithIconChild({
    required this.label,
    required this.icon,
    required this.buttonStyle,
    required this.iconAlignment,
  });

  final Widget label;
  final Widget icon;
  final GradientButtonStyle? buttonStyle;
  final IconAlignment iconAlignment;

  @override
  Widget build(BuildContext context) {
    final double defaultFontSize =
        buttonStyle?.textStyle?.resolve(const <WidgetState>{})?.fontSize ??
            14.0;
    final double scale = clampDouble(
            MediaQuery.textScalerOf(context).scale(defaultFontSize) / 14.0,
            1.0,
            2.0) -
        1.0;
    final double gap = lerpDouble(8, 4, scale)!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: iconAlignment == IconAlignment.start
          ? <Widget>[icon, SizedBox(width: gap), Flexible(child: label)]
          : <Widget>[Flexible(child: label), SizedBox(width: gap), icon],
    );
  }
}

// BEGIN GENERATED TOKEN PROPERTIES - ElevatedButton

// Do not edit by hand. The code between the "BEGIN GENERATED" and
// "END GENERATED" comments are generated from data in the Material
// Design token database by the script:
//   dev/tools/gen_defaults/bin/gen_defaults.dart.

class _GradientElevatedButtonDefaultsM3 extends GradientButtonStyle {
  _GradientElevatedButtonDefaultsM3(this.context)
      : super(
          animationDuration: kThemeChangeDuration,
          enableFeedback: true,
          alignment: Alignment.center,
        );

  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;

  @override
  WidgetStateProperty<TextStyle?> get textStyle =>
      WidgetStatePropertyAll<TextStyle?>(
          Theme.of(context).textTheme.labelLarge);

  @override
  WidgetStateProperty<Gradient?>? get backgroundGradient =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return _basicDisabledGradient(_colors);
        }
        return _basicGradient(_colors);
      });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return _colors.onSurface.withOpacityDeprecated(0.38);
        }
        return _colors.primary;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return _colors.primary.withOpacityDeprecated(0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return _colors.primary.withOpacityDeprecated(0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return _colors.primary.withOpacityDeprecated(0.1);
        }
        return null;
      });

  @override
  WidgetStateProperty<Color>? get shadowColor =>
      WidgetStatePropertyAll<Color>(_colors.shadow);

  @override
  WidgetStateProperty<Color>? get surfaceTintColor =>
      const WidgetStatePropertyAll<Color>(Colors.transparent);

  @override
  WidgetStateProperty<double>? get elevation =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return 0.0;
        }
        if (states.contains(WidgetState.pressed)) {
          return 1.0;
        }
        if (states.contains(WidgetState.hovered)) {
          return 1.0;
        }
        if (states.contains(WidgetState.focused)) {
          return 1.0;
        }
        return 1.0;
      });

  @override
  WidgetStateProperty<EdgeInsetsGeometry>? get padding =>
      WidgetStatePropertyAll<EdgeInsetsGeometry>(_scaledPadding(context));

  @override
  WidgetStateProperty<Size>? get minimumSize =>
      const WidgetStatePropertyAll<Size>(Size(64.0, 40.0));

  // No default fixedSize

  @override
  WidgetStateProperty<double>? get iconSize =>
      const WidgetStatePropertyAll<double>(18.0);

  @override
  WidgetStateProperty<Color>? get iconColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return _colors.onSurface.withOpacityDeprecated(0.38);
      }
      if (states.contains(WidgetState.pressed)) {
        return _colors.primary;
      }
      if (states.contains(WidgetState.hovered)) {
        return _colors.primary;
      }
      if (states.contains(WidgetState.focused)) {
        return _colors.primary;
      }
      return _colors.primary;
    });
  }

  @override
  WidgetStateProperty<Size>? get maximumSize =>
      const WidgetStatePropertyAll<Size>(Size.infinite);

  // No default side

  @override
  WidgetStateProperty<OutlinedBorder>? get shape =>
      const WidgetStatePropertyAll<OutlinedBorder>(StadiumBorder());

  @override
  WidgetStateProperty<MouseCursor?>? get mouseCursor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      });

  @override
  VisualDensity? get visualDensity {
    return Theme.of(context).visualDensity;
  }

  @override
  MaterialTapTargetSize? get tapTargetSize =>
      Theme.of(context).materialTapTargetSize;

  @override
  InteractiveInkFeatureFactory? get splashFactory =>
      Theme.of(context).splashFactory;
}

Gradient _basicGradient(ColorScheme colorScheme) {
  return LinearGradient(
    colors: [colorScheme.primary, colorScheme.secondary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

Gradient _basicDisabledGradient(ColorScheme colorScheme) {
  return LinearGradient(
    colors: [
      colorScheme.onSurface.withOpacityDeprecated(0.1),
      colorScheme.onSurface.withOpacityDeprecated(0.2),
      colorScheme.onSurface.withOpacityDeprecated(0.1)
    ],
  );
}

Gradient _gradientFromColor(Color color) {
  return LinearGradient(
    colors: [color, color.withOpacityDeprecated(0.6)], // Example gradient
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
