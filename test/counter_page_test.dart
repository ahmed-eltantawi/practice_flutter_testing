import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/main.dart';
import 'package:material_ui/material_ui.dart';

main() {
  testWidgets('Test counter page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CounterPage(title: 'Title')));

    Finder textZero = find.text('0');
    Finder elevatedBut = find.byType(FloatingActionButton);

    // ==== test if the widgets built correctly ====
    expect(textZero, findsOneWidget);
    expect(elevatedBut, findsOneWidget);

    // ==== Simulation of pressing the button ====
    await tester.tap(elevatedBut);
    await tester.pumpAndSettle();

    // === test if the counter updated ====
    Finder textOne = find.text('1');

    // ==== test the result =====
    expect(textOne, findsOneWidget);
    expect(textZero, findsNothing);
  });
}
