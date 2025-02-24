part of '../gradient_elevated_button.dart';

/// The base [StatefulWidget] class for customizable buttons defined by a [GradientButtonStyle] object.
///
/// Concrete subclasses must override [defaultStyleOf] to define the button's default styling
/// and [themeStyleOf] to integrate the button with the current theme.
///
/// Subclasses of [GradientButtonStyleButton] include various button types with gradient support:
///
/// - [GradientElevatedButton]: A button with a gradient background that elevates when pressed.
///
/// This class provides a flexible API for creating custom button implementations
/// that can leverage [GradientButtonStyle] for fine-grained control over appearance and behavior.
///
/// Key style properties include:
/// - [backgroundGradient]: Defines the gradient used for the button's background.
/// - [disabledGradient]: Defines the gradient used when the button is disabled.
///
/// For more details, see:
/// - [GradientButtonStyle]: The style configuration class for [GradientButtonStyleButton].
/// - [Material Design Buttons Overview](https://m3.material.io/components/buttons/overview),
///   an overview of Material Design button types and their recommended use cases.

abstract class GradientButtonStyleButton extends StatefulWidget {
  /// An abstract const constructor. This allows subclasses to define their own
  /// const constructors, enabling instances of those subclasses to be used
  /// in const expressions, ensuring immutability and compile-time evaluation where applicable.

  const GradientButtonStyleButton({
    super.key,
    required this.onPressed,
    required this.onLongPress,
    required this.onHover,
    required this.onFocusChange,
    required this.style,
    required this.focusNode,
    required this.autofocus,
    required this.clipBehavior,
    this.statesController,
    this.isSemanticButton = true,
    this.iconAlignment = IconAlignment.start,
    this.tooltip,
    required this.child,
  });

  /// Called when the button is tapped or otherwise activated.
  ///
  /// If this callback and [onLongPress] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  ///
  /// If this callback and [onPressed] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onLongPress;

  /// Called when a pointer enters or exits the button response area.
  ///
  /// The value passed to the callback is true if a pointer has entered this
  /// part of the material and false if a pointer has exited this part of the
  /// material.
  final ValueChanged<bool>? onHover;

  /// Handler called when the focus changes.
  ///
  /// Called with true if this widget's node gains focus, and false if it loses
  /// focus.
  final ValueChanged<bool>? onFocusChange;

  /// Customizes this button's appearance.
  ///
  /// Non-null properties of this style override the corresponding
  /// properties in [themeStyleOf] and [defaultStyleOf]. [WidgetStateProperty]s
  /// that resolve to non-null values will similarly override the corresponding
  /// [WidgetStateProperty]s in [themeStyleOf] and [defaultStyleOf].
  ///
  /// Null by default.
  final GradientButtonStyle? style;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none] unless [GradientButtonStyle.backgroundBuilder] or
  /// [GradientButtonStyle.foregroundBuilder] is specified. In those
  /// cases the default is [Clip.antiAlias].
  final Clip? clipBehavior;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.material.inkwell.statesController}
  final WidgetStatesController? statesController;

  /// Determine whether this subtree represents a button.
  ///
  /// If this is null, the screen reader will not announce "button" when this
  /// is focused. This is useful for [MenuItemButton] and [SubmenuButton] when we
  /// traverse the menu system.
  ///
  /// Defaults to true.
  final bool? isSemanticButton;

  /// {@macro flutter.material.GradientButtonStyleButton.iconAlignment}
  final IconAlignment iconAlignment;

  /// Text that describes the action that will occur when the button is pressed or
  /// hovered over.
  ///
  /// This text is displayed when the user long-presses or hovers over the button
  /// in a tooltip. This string is also used for accessibility.
  ///
  /// If null, the button will not display a tooltip.
  final String? tooltip;

  /// Typically the button's label.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// Returns a [GradientButtonStyle] that's based primarily on the [Theme]'s
  /// [ThemeData.textTheme] and [ThemeData.colorScheme], but has most values
  /// filled out (non-null).
  ///
  /// The returned style can be overridden by the [style] parameter and by the
  /// style returned by [themeStyleOf] that some button-specific themes like
  /// [TextButtonTheme] or [ElevatedButtonTheme] override. For example the
  /// default style of the [TextButton] subclass can be overridden with its
  /// [TextButton.style] constructor parameter, or with a [TextButtonTheme].
  ///
  /// Concrete button subclasses should return a [GradientButtonStyle] with as many
  /// non-null properties as possible, where all of the non-null
  /// [WidgetStateProperty] properties resolve to non-null values.
  ///
  /// ## Properties that can be null
  ///
  /// Some properties, like [GradientButtonStyle.fixedSize] would override other values
  /// in the same [GradientButtonStyle] if set, so they are allowed to be null.  Here is
  /// a summary of properties that are allowed to be null when returned in the
  /// [GradientButtonStyle] returned by this function, an why:
  ///
  /// - [GradientButtonStyle.fixedSize] because it would override other values in the
  ///   same [GradientButtonStyle], like [GradientButtonStyle.maximumSize].
  /// - [GradientButtonStyle.side] because null is a valid value for a button that has
  ///   no side. [OutlinedButton] returns a non-null default for this, however.
  /// - [GradientButtonStyle.backgroundBuilder] and [GradientButtonStyle.foregroundBuilder]
  ///   because they would override the [GradientButtonStyle.foregroundColor] and
  ///   [GradientButtonStyle.backgroundGradient] of the same [GradientButtonStyle].
  ///
  /// See also:
  ///
  /// * [themeStyleOf], returns the ButtonStyle of this button's component
  ///   theme.
  @protected
  GradientButtonStyle defaultStyleOf(BuildContext context);

  /// Returns the GradientButtonStyle that belongs to the button's component theme.
  ///
  /// The returned style can be overridden by the [style] parameter.
  ///
  /// Concrete button subclasses should return the GradientButtonStyle for the
  /// nearest subclass-specific inherited theme, and if no such theme
  /// exists, then the same value from the overall [Theme].
  ///
  /// See also:
  ///
  ///  * [defaultStyleOf], Returns the default [GradientButtonStyle] for this button.
  @protected
  GradientButtonStyle? themeStyleOf(BuildContext context);

  /// Whether the button is enabled or disabled.
  ///
  /// Buttons are disabled by default. To enable a button, set its [onPressed]
  /// or [onLongPress] properties to a non-null value.
  bool get enabled => onPressed != null || onLongPress != null;

  @override
  State<GradientButtonStyleButton> createState() => _GradientButtonStyleState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(FlagProperty('enabled', value: enabled, ifFalse: 'disabled'));
    properties.add(DiagnosticsProperty<GradientButtonStyle>('style', style,
        defaultValue: null));
    properties.add(DiagnosticsProperty<FocusNode>('focusNode', focusNode,
        defaultValue: null));
  }

  /// Returns null if [value] is null, otherwise `WidgetStatePropertyAll<T>(value)`.
  ///
  /// A convenience method for subclasses.
  static WidgetStateProperty<T>? allOrNull<T>(T? value) =>
      value == null ? null : WidgetStatePropertyAll<T>(value);

  /// Returns null if [enabled] and [disabled] are null.
  /// Otherwise, returns a [WidgetStateProperty] that resolves to [disabled]
  /// when [WidgetState.disabled] is active, and [enabled] otherwise.
  ///
  /// A convenience method for subclasses.
  static WidgetStateProperty<Gradient?>? defaultGradient(
      Gradient? enabled, Gradient? disabled) {
    if ((enabled ?? disabled) == null) {
      return null;
    }
    return WidgetStateProperty<Gradient?>.fromMap(
      <WidgetStatesConstraint, Gradient?>{
        WidgetState.disabled: disabled,
        WidgetState.any: enabled,
      },
    );
  }

  static WidgetStateProperty<Color?>? defaultColor(
      Color? enabled, Color? disabled) {
    if ((enabled ?? disabled) == null) {
      return null;
    }
    return WidgetStateProperty<Color?>.fromMap(
      <WidgetStatesConstraint, Color?>{
        WidgetState.disabled: disabled,
        WidgetState.any: enabled,
      },
    );
  }

  /// A convenience method used by subclasses in the framework, that returns an
  /// interpolated value based on the [fontSizeMultiplier] parameter:
  ///
  ///  * 0 - 1 [geometry1x]
  ///  * 1 - 2 lerp([geometry1x], [geometry2x], [fontSizeMultiplier] - 1)
  ///  * 2 - 3 lerp([geometry2x], [geometry3x], [fontSizeMultiplier] - 2)
  ///  * otherwise [geometry3x]
  ///
  /// This method is used by the framework for estimating the default paddings to
  /// use on a button with a text label, when the system text scaling setting
  /// changes. It's usually supplied with empirical [geometry1x], [geometry2x],
  /// [geometry3x] values adjusted for different system text scaling values, when
  /// the unscaled font size is set to 14.0 (the default [TextTheme.labelLarge]
  /// value).
  ///
  /// The `fontSizeMultiplier` argument, for historical reasons, is the default
  /// font size specified in the [GradientButtonStyle], scaled by the ambient font
  /// scaler, then divided by 14.0 (the default font size used in buttons).
  static EdgeInsetsGeometry scaledPadding(
    EdgeInsetsGeometry geometry1x,
    EdgeInsetsGeometry geometry2x,
    EdgeInsetsGeometry geometry3x,
    double fontSizeMultiplier,
  ) {
    return switch (fontSizeMultiplier) {
      <= 1 => geometry1x,
      < 2 => EdgeInsetsGeometry.lerp(
          geometry1x, geometry2x, fontSizeMultiplier - 1)!,
      < 3 => EdgeInsetsGeometry.lerp(
          geometry2x, geometry3x, fontSizeMultiplier - 2)!,
      _ => geometry3x,
    };
  }
}

/// The base [State] class for buttons whose style is defined by a [GradientButtonStyle] object.
///
/// See also:
///
///  * [ButtonStyleButton], the [StatefulWidget] subclass for which this class is the [State].
///  * [ElevatedButton], a filled button whose material elevates when pressed.
///  * [FilledButton], a filled ButtonStyleButton that doesn't elevate when pressed.
///  * [OutlinedButton], similar to [TextButton], but with an outline.
///  * [TextButton], a simple button without a shadow.
class _GradientButtonStyleState extends State<GradientButtonStyleButton>
    with TickerProviderStateMixin {
  AnimationController? controller;
  double? elevation;
  Gradient? backgroundGradient;
  WidgetStatesController? internalStatesController;

  void handleStatesControllerChange() {
    // Force a rebuild to resolve WidgetStateProperty properties
    setState(() {});
  }

  WidgetStatesController get statesController =>
      widget.statesController ?? internalStatesController!;

  void initStatesController() {
    if (widget.statesController == null) {
      internalStatesController = WidgetStatesController();
    }
    statesController.update(WidgetState.disabled, !widget.enabled);
    statesController.addListener(handleStatesControllerChange);
  }

  @override
  void initState() {
    super.initState();
    initStatesController();
  }

  @override
  void didUpdateWidget(GradientButtonStyleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.statesController != oldWidget.statesController) {
      oldWidget.statesController?.removeListener(handleStatesControllerChange);
      if (widget.statesController != null) {
        internalStatesController?.dispose();
        internalStatesController = null;
      }
      initStatesController();
    }
    if (widget.enabled != oldWidget.enabled) {
      statesController.update(WidgetState.disabled, !widget.enabled);
      if (!widget.enabled) {
        // The button may have been disabled while a press gesture is currently underway.
        statesController.update(WidgetState.pressed, false);
      }
    }
  }

  @override
  void dispose() {
    statesController.removeListener(handleStatesControllerChange);
    internalStatesController?.dispose();
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GradientButtonStyle? widgetStyle = widget.style;
    final GradientButtonStyle? primaryStyle =
        GradientButtonThemeData.of(context) ?? widget.themeStyleOf(context);
    final GradientButtonStyle defaultStyle = widget.defaultStyleOf(context);
    T? effectiveValue<T>(T? Function(GradientButtonStyle? style) getProperty) {
      final T? widgetValue = getProperty(widgetStyle);
      final T? primaryThemeValue = getProperty(primaryStyle);
      // final T? themeValue = getProperty(themeStyle);
      final T? defaultValue = getProperty(defaultStyle);
      return widgetValue ?? primaryThemeValue /*?? themeValue*/ ?? defaultValue;
    }

    T? resolve<T>(
        WidgetStateProperty<T>? Function(GradientButtonStyle? style)
            getProperty) {
      return effectiveValue(
        (GradientButtonStyle? style) {
          return getProperty(style)?.resolve(statesController.value);
        },
      );
    }

    final double? resolvedElevation =
        resolve<double?>((GradientButtonStyle? style) => style?.elevation);
    final TextStyle? resolvedTextStyle =
        resolve<TextStyle?>((GradientButtonStyle? style) => style?.textStyle);

    Gradient? resolvedBackgroundGradient = resolve<Gradient?>(
            (GradientButtonStyle? style) => style?.backgroundGradient) ??
        resolve<Gradient?>(
            (GradientButtonStyle? style) => style?.backgroundGradient);

    final Color? resolvedForegroundColor =
        resolve<Color?>((GradientButtonStyle? style) => style?.foregroundColor);
    final Color? resolvedShadowColor =
        resolve<Color?>((GradientButtonStyle? style) => style?.shadowColor);
    final Color? resolvedSurfaceTintColor = resolve<Color?>(
        (GradientButtonStyle? style) => style?.surfaceTintColor);
    final EdgeInsetsGeometry? resolvedPadding = resolve<EdgeInsetsGeometry?>(
        (GradientButtonStyle? style) => style?.padding);
    final Size? resolvedMinimumSize =
        resolve<Size?>((GradientButtonStyle? style) => style?.minimumSize);
    final Size? resolvedFixedSize =
        resolve<Size?>((GradientButtonStyle? style) => style?.fixedSize);
    final Size? resolvedMaximumSize =
        resolve<Size?>((GradientButtonStyle? style) => style?.maximumSize);
    final Color? resolvedIconColor =
        resolve<Color?>((GradientButtonStyle? style) => style?.iconColor);
    final double? resolvedIconSize =
        resolve<double?>((GradientButtonStyle? style) => style?.iconSize);
    final BorderSide? resolvedSide =
        resolve<BorderSide?>((GradientButtonStyle? style) => style?.side);
    final OutlinedBorder? resolvedShape =
        resolve<OutlinedBorder?>((GradientButtonStyle? style) => style?.shape);

    final WidgetStateMouseCursor mouseCursor = _MouseCursor(
      (Set<WidgetState> states) => effectiveValue(
          (GradientButtonStyle? style) => style?.mouseCursor?.resolve(states)),
    );

    final WidgetStateProperty<Color?> overlayColor =
        WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) => effectiveValue(
          (GradientButtonStyle? style) => style?.overlayColor?.resolve(states)),
    );

    final VisualDensity? resolvedVisualDensity =
        effectiveValue((GradientButtonStyle? style) => style?.visualDensity);

    final MaterialTapTargetSize? resolvedTapTargetSize =
        effectiveValue((GradientButtonStyle? style) => style?.tapTargetSize);
    final Duration? resolvedAnimationDuration = effectiveValue(
        (GradientButtonStyle? style) => style?.animationDuration);
    final bool? resolvedEnableFeedback =
        effectiveValue((GradientButtonStyle? style) => style?.enableFeedback);
    final AlignmentGeometry? resolvedAlignment =
        effectiveValue((GradientButtonStyle? style) => style?.alignment);
    final Offset densityAdjustment = resolvedVisualDensity!.baseSizeAdjustment;
    final InteractiveInkFeatureFactory? resolvedSplashFactory =
        effectiveValue((GradientButtonStyle? style) => style?.splashFactory);
    final ButtonLayerBuilder? resolvedBackgroundBuilder = effectiveValue(
        (GradientButtonStyle? style) => style?.backgroundBuilder);
    final ButtonLayerBuilder? resolvedForegroundBuilder = effectiveValue(
        (GradientButtonStyle? style) => style?.foregroundBuilder);

    final Clip effectiveClipBehavior = widget.clipBehavior ??
        ((resolvedBackgroundBuilder ?? resolvedForegroundBuilder) != null
            ? Clip.antiAlias
            : Clip.none);

    BoxConstraints effectiveConstraints =
        resolvedVisualDensity.effectiveConstraints(
      BoxConstraints(
        minWidth: resolvedMinimumSize!.width,
        minHeight: resolvedMinimumSize.height,
        maxWidth: resolvedMaximumSize!.width,
        maxHeight: resolvedMaximumSize.height,
      ),
    );
    if (resolvedFixedSize != null) {
      final Size size = effectiveConstraints.constrain(resolvedFixedSize);
      if (size.width.isFinite) {
        effectiveConstraints = effectiveConstraints.copyWith(
          minWidth: size.width,
          maxWidth: size.width,
        );
      }
      if (size.height.isFinite) {
        effectiveConstraints = effectiveConstraints.copyWith(
          minHeight: size.height,
          maxHeight: size.height,
        );
      }
    }

    // Per the Material Design team: don't allow the VisualDensity
    // adjustment to reduce the width of the left/right padding. If we
    // did, VisualDensity.compact, the default for desktop/web, would
    // reduce the horizontal padding to zero.
    final double dy = densityAdjustment.dy;
    final double dx = math.max(0, densityAdjustment.dx);
    final EdgeInsetsGeometry padding = resolvedPadding!
        .add(EdgeInsets.fromLTRB(dx, dy, dx, dy))
        .clamp(EdgeInsets.zero, EdgeInsetsGeometry.infinity);

    // If an opaque button's background is becoming translucent while its
    // elevation is changing, change the elevation first. Material implicitly
    // animates its elevation but not its color. SKIA renders non-zero
    // elevations as a shadow colored fill behind the Material's background.
    if (resolvedAnimationDuration! > Duration.zero &&
        elevation != null &&
        backgroundGradient != null &&
        elevation != resolvedElevation
        // && backgroundGradient!.value != resolvedBackgroundGradient!.value
        // && backgroundGradient!.opacity == 1
        // && resolvedBackgroundGradient.opacity < 1
        &&
        resolvedElevation == 0) {
      if (controller?.duration != resolvedAnimationDuration) {
        controller?.dispose();
        controller = AnimationController(
          duration: resolvedAnimationDuration,
          vsync: this,
        )..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              setState(() {}); // Rebuild with the final background color.
            }
          });
      }
      resolvedBackgroundGradient =
          backgroundGradient; // Defer changing the background color.
      controller!.value = 0;
      controller!.forward();
    }
    elevation = resolvedElevation;
    backgroundGradient = resolvedBackgroundGradient;

    Widget effectiveChild = Padding(
      padding: padding,
      child: Align(
        alignment: resolvedAlignment!,
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: resolvedForegroundBuilder != null
            ? resolvedForegroundBuilder(
                context, statesController.value, widget.child)
            : widget.child,
      ),
    );
    if (resolvedBackgroundBuilder != null) {
      effectiveChild = resolvedBackgroundBuilder(
          context, statesController.value, effectiveChild);
    }

    if (widget.tooltip != null) {
      effectiveChild = Tooltip(
        message: widget.tooltip,
        child: effectiveChild,
      );
    }

    final Widget result = Card(
      margin: EdgeInsets.zero,
      elevation: resolvedElevation!,
      surfaceTintColor: resolvedSurfaceTintColor,
      shadowColor: resolvedShadowColor,
      color: Colors.transparent,
      clipBehavior: effectiveClipBehavior,
      shape: resolvedShape?.copyWith(side: resolvedSide) ??
          const RoundedRectangleBorder(),
      child: Container(
        decoration: ShapeDecoration(
          gradient: resolvedBackgroundGradient,
          shape: resolvedShape?.copyWith(side: resolvedSide) ??
              const RoundedRectangleBorder(),
        ),
        child: ConstrainedBox(
          constraints: effectiveConstraints,
          child: Material(
            elevation: 0,
            textStyle:
                resolvedTextStyle?.copyWith(color: resolvedForegroundColor),
            color: Colors.transparent,
            type: resolvedBackgroundGradient == null
                ? MaterialType.transparency
                : MaterialType.button,
            animationDuration: resolvedAnimationDuration,
            child: InkWell(
              onTap: widget.onPressed,
              onLongPress: widget.onLongPress,
              onHover: widget.onHover,
              mouseCursor: mouseCursor,
              enableFeedback: resolvedEnableFeedback??true,
              focusNode: widget.focusNode,
              canRequestFocus: widget.enabled,
              onFocusChange: widget.onFocusChange,
              autofocus: widget.autofocus,
              splashFactory: resolvedSplashFactory,
              overlayColor: overlayColor,
              highlightColor: Colors.transparent,
              customBorder: resolvedShape?.copyWith(side: resolvedSide),
              statesController: statesController,
              child: IconTheme.merge(
                data: IconThemeData(
                  color: resolvedIconColor ?? resolvedForegroundColor,
                  size: resolvedIconSize,
                ),
                child: effectiveChild,
              ),
            ),
          ),
        ),
      ),
    );

    final Size minSize;
    switch (resolvedTapTargetSize!) {
      case MaterialTapTargetSize.padded:
        minSize = Size(
          kMinInteractiveDimension + densityAdjustment.dx,
          kMinInteractiveDimension + densityAdjustment.dy,
        );
        assert(minSize.width >= 0.0);
        assert(minSize.height >= 0.0);
      case MaterialTapTargetSize.shrinkWrap:
        minSize = Size.zero;
    }

    return Semantics(
      container: true,
      button: widget.isSemanticButton,
      enabled: widget.enabled,
      child: _InputPadding(
        minSize: minSize,
        child: result,
      ),
    );
  }
}

class _MouseCursor extends WidgetStateMouseCursor {
  const _MouseCursor(this.resolveCallback);

  final WidgetPropertyResolver<MouseCursor?> resolveCallback;

  @override
  MouseCursor resolve(Set<WidgetState> states) => resolveCallback(states)!;

  @override
  String get debugDescription => 'GradientButtonStyleButton_MouseCursor';
}

/// A widget to pad the area around a [GradientButtonStyleButton]'s inner [Material].
///
/// Redirect taps that occur in the padded area around the child to the center
/// of the child. This increases the size of the button and the button's
/// "tap target", but not its material or its ink splashes.
class _InputPadding extends SingleChildRenderObjectWidget {
  const _InputPadding({
    super.child,
    required this.minSize,
  });

  final Size minSize;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderInputPadding(minSize);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant _RenderInputPadding renderObject) {
    renderObject.minSize = minSize;
  }
}

class _RenderInputPadding extends RenderShiftedBox {
  _RenderInputPadding(this._minSize, [RenderBox? child]) : super(child);

  Size get minSize => _minSize;
  Size _minSize;

  set minSize(Size value) {
    if (_minSize == value) {
      return;
    }
    _minSize = value;
    markNeedsLayout();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child != null) {
      return math.max(child!.getMinIntrinsicWidth(height), minSize.width);
    }
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child != null) {
      return math.max(child!.getMinIntrinsicHeight(width), minSize.height);
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child != null) {
      return math.max(child!.getMaxIntrinsicWidth(height), minSize.width);
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child != null) {
      return math.max(child!.getMaxIntrinsicHeight(width), minSize.height);
    }
    return 0.0;
  }

  Size _computeSize(
      {required BoxConstraints constraints,
      required ChildLayouter layoutChild}) {
    if (child != null) {
      final Size childSize = layoutChild(child!, constraints);
      final double height = math.max(childSize.width, minSize.width);
      final double width = math.max(childSize.height, minSize.height);
      return constraints.constrain(Size(height, width));
    }
    return Size.zero;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _computeSize(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.dryLayoutChild,
    );
  }

  @override
  double? computeDryBaseline(
      covariant BoxConstraints constraints, TextBaseline baseline) {
    final RenderBox? child = this.child;
    if (child == null) {
      return null;
    }
    final double? result = child.getDryBaseline(constraints, baseline);
    if (result == null) {
      return null;
    }
    final Size childSize = child.getDryLayout(constraints);
    return result +
        Alignment.center
            .alongOffset(getDryLayout(constraints) - childSize as Offset)
            .dy;
  }

  @override
  void performLayout() {
    size = _computeSize(
      constraints: constraints,
      layoutChild: ChildLayoutHelper.layoutChild,
    );
    if (child != null) {
      final BoxParentData childParentData = child!.parentData! as BoxParentData;
      childParentData.offset =
          Alignment.center.alongOffset(size - child!.size as Offset);
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (super.hitTest(result, position: position)) {
      return true;
    }
    final Offset center = child!.size.center(Offset.zero);
    return result.addWithRawTransform(
      transform: MatrixUtils.forceToPoint(center),
      position: center,
      hitTest: (BoxHitTestResult result, Offset position) {
        assert(position == center);
        return child!.hitTest(result, position: center);
      },
    );
  }
}
