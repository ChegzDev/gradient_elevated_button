import 'package:example/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';

void main() {
  testWidgets('Example app renders gradient buttons', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(GradientElevatedButton), findsWidgets);
    expect(tester.takeException(), isNull);
  });
}
