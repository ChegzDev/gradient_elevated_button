import 'package:flutter_test/flutter_test.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

const _blueGreen = LinearGradient(colors: [Colors.blue, Colors.green]);
const _redOrange = LinearGradient(colors: [Colors.red, Colors.orange]);
const _greys = LinearGradient(colors: [Colors.grey, Colors.black12]);

/// The gradient painted behind the button labelled [label].
Gradient? _paintedGradient(WidgetTester tester, String label) {
  final container = tester.widget<Container>(
    find.ancestor(of: find.text(label), matching: find.byType(Container)).last,
  );
  return (container.decoration as ShapeDecoration?)?.gradient;
}

Widget _app(Widget child, {ThemeData? theme}) => MaterialApp(
      theme: theme,
      home: Scaffold(body: Center(child: child)),
    );

void main() {
  testWidgets('paints the style gradient and calls onPressed', (tester) async {
    var taps = 0;
    var longPresses = 0;
    await tester.pumpWidget(
      _app(
        GradientElevatedButton(
          onPressed: () => taps++,
          onLongPress: () => longPresses++,
          style: GradientElevatedButton.styleFrom(
            backgroundGradient: _blueGreen,
            foregroundColor: Colors.white,
          ),
          child: const Text('Go'),
        ),
      ),
    );

    expect(_paintedGradient(tester, 'Go'), _blueGreen);
    await tester.tap(find.text('Go'));
    await tester.longPress(find.text('Go'));
    await tester.pumpAndSettle();
    expect(taps, 1);
    expect(longPresses, 1);

    final textColor =
        DefaultTextStyle.of(tester.element(find.text('Go'))).style.color;
    expect(textColor, Colors.white);
  });

  testWidgets('a disabled button paints the disabled gradient', (tester) async {
    await tester.pumpWidget(
      _app(
        GradientElevatedButton(
          onPressed: null,
          style: GradientElevatedButton.styleFrom(
            backgroundGradient: _blueGreen,
            disabledBackgroundGradient: _greys,
          ),
          child: const Text('Off'),
        ),
      ),
    );

    expect(_paintedGradient(tester, 'Off'), _greys);
    expect(
      tester
          .widget<GradientElevatedButton>(find.byType(GradientElevatedButton))
          .enabled,
      isFalse,
    );
  });

  testWidgets('switches gradient when enabled changes', (tester) async {
    Widget button(VoidCallback? onPressed) => _app(
          GradientElevatedButton(
            onPressed: onPressed,
            style: GradientElevatedButton.styleFrom(
              backgroundGradient: _blueGreen,
              disabledBackgroundGradient: _greys,
            ),
            child: const Text('B'),
          ),
        );

    await tester.pumpWidget(button(() {}));
    expect(_paintedGradient(tester, 'B'), _blueGreen);
    await tester.pumpWidget(button(null));
    await tester.pumpAndSettle();
    expect(_paintedGradient(tester, 'B'), _greys);
    await tester.pumpWidget(button(() {}));
    await tester.pumpAndSettle();
    expect(_paintedGradient(tester, 'B'), _blueGreen);
  });

  testWidgets('uses GradientButtonThemeExtension from ThemeData', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        GradientElevatedButton(onPressed: () {}, child: const Text('Themed')),
        theme: ThemeData(
          extensions: <ThemeExtension<dynamic>>[
            GradientButtonThemeExtension(
              style: GradientElevatedButton.styleFrom(
                backgroundGradient: _redOrange,
              ),
            ),
          ],
        ),
      ),
    );

    expect(_paintedGradient(tester, 'Themed'), _redOrange);
  });

  testWidgets('the widget style wins over the theme extension', (tester) async {
    await tester.pumpWidget(
      _app(
        GradientElevatedButton(
          onPressed: () {},
          style: GradientElevatedButton.styleFrom(
            backgroundGradient: _blueGreen,
          ),
          child: const Text('Own'),
        ),
        theme: ThemeData(
          extensions: <ThemeExtension<dynamic>>[
            GradientButtonThemeExtension(
              style: GradientElevatedButton.styleFrom(
                backgroundGradient: _redOrange,
              ),
            ),
          ],
        ),
      ),
    );

    expect(_paintedGradient(tester, 'Own'), _blueGreen);
  });

  testWidgets('deprecated GradientButtonThemeData still applies', (
    tester,
  ) async {
    await tester.pumpWidget(
      // ignore: deprecated_member_use_from_same_package
      GradientButtonThemeData(
        data: GradientElevatedButton.styleFrom(backgroundGradient: _redOrange),
        child: _app(
          GradientElevatedButton(onPressed: () {}, child: const Text('Old')),
        ),
      ),
    );

    expect(_paintedGradient(tester, 'Old'), _redOrange);
  });

  testWidgets('GradientButtonTheme applies and can be rebuilt', (tester) async {
    Widget themed(Gradient gradient) => _app(
          GradientButtonTheme(
            data: GradientElevatedButtonThemeData(
              style: GradientElevatedButton.styleFrom(
                  backgroundGradient: gradient),
            ),
            child: GradientElevatedButton(
                onPressed: () {}, child: const Text('T')),
          ),
        );

    await tester.pumpWidget(themed(_blueGreen));
    expect(_paintedGradient(tester, 'T'), _blueGreen);
    await tester.pumpWidget(themed(_redOrange));
    expect(tester.takeException(), isNull);
    expect(_paintedGradient(tester, 'T'), _redOrange);
  });

  testWidgets('animating between themes interpolates the extension', (
    tester,
  ) async {
    ThemeData theme(Gradient g) => ThemeData(
          extensions: <ThemeExtension<dynamic>>[
            GradientButtonThemeExtension(
              style: GradientElevatedButton.styleFrom(backgroundGradient: g),
            ),
          ],
        );

    await tester.pumpWidget(
      _app(
        GradientElevatedButton(onPressed: () {}, child: const Text('A')),
        theme: theme(_blueGreen),
      ),
    );
    await tester.pumpWidget(
      _app(
        GradientElevatedButton(onPressed: () {}, child: const Text('A')),
        theme: theme(_redOrange),
      ),
    );
    await tester.pump(const Duration(milliseconds: 50));
    expect(tester.takeException(), isNull);
    final mid = _paintedGradient(tester, 'A');
    expect(mid, isNot(_blueGreen));
    expect(mid, isNot(_redOrange));
    await tester.pumpAndSettle();
    expect(_paintedGradient(tester, 'A'), _redOrange);
  });

  test('GradientButtonThemeExtension copyWith and lerp', () {
    final a = GradientButtonThemeExtension(
      style: GradientElevatedButton.styleFrom(backgroundGradient: _blueGreen),
    );
    final b = GradientButtonThemeExtension(
      style: GradientElevatedButton.styleFrom(backgroundGradient: _redOrange),
    );
    List<int>? colorsAt(double t) => a
        .lerp(b, t)
        .style
        ?.backgroundGradient
        ?.resolve(<WidgetState>{})
        ?.colors
        .map((c) => c.toARGB32())
        .toList();

    expect(a.copyWith().style, same(a.style));
    expect(a.copyWith(style: b.style).style, same(b.style));
    expect(a.lerp(null, 0.5), same(a));
    expect(colorsAt(0), _blueGreen.colors.map((c) => c.toARGB32()).toList());
    expect(colorsAt(1), _redOrange.colors.map((c) => c.toARGB32()).toList());
  });

  testWidgets('works with an external statesController and swaps it', (
    tester,
  ) async {
    final first = WidgetStatesController();
    final second = WidgetStatesController();
    addTearDown(first.dispose);
    addTearDown(second.dispose);

    Widget button(WidgetStatesController? c) => _app(
          GradientElevatedButton(
            onPressed: () {},
            statesController: c,
            style: GradientElevatedButton.styleFrom(
                backgroundGradient: _blueGreen),
            child: const Text('S'),
          ),
        );

    await tester.pumpWidget(button(first));
    await tester.pumpWidget(button(second));
    await tester.pumpWidget(button(null));
    await tester.pumpWidget(button(first));
    await tester.pumpWidget(const SizedBox());
    expect(tester.takeException(), isNull);
  });

  testWidgets('GradientElevatedButton.icon shows icon and label', (
    tester,
  ) async {
    var taps = 0;
    await tester.pumpWidget(
      _app(
        GradientElevatedButton.icon(
          onPressed: () => taps++,
          icon: const Icon(Icons.send),
          label: const Text('Send'),
          style: GradientElevatedButton.styleFrom(
            backgroundGradient: _blueGreen,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.send), findsOneWidget);
    await tester.tap(find.text('Send'));
    expect(taps, 1);
  });
}
