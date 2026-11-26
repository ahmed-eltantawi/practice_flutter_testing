import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/my_widget.dart';
import 'package:material_ui/material_ui.dart';

main() {
  group('WIDGET TESTING', () {
    // ==================== by text ==================
    testWidgets("Find if the title and subtitle of my widget shown or not", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MyWidget(title: 't', subtitle: 's'));

      Finder titleFinder = find.text('t');
      Finder subtitle = find.text('s');

      expect(titleFinder, findsOneWidget);
      expect(subtitle, findsNWidgets(2));
    });

    // ============================= by key ==========================
    testWidgets('test widget by key', (WidgetTester tester) async {
      await tester.pumpWidget(const MyWidget(title: 't', subtitle: 's'));

      Finder keyFinder = find.byKey(const Key('MyWidget'));

      expect(keyFinder, findsOneWidget);

      Finder appBarTitleFinder = find.descendant(
        of: keyFinder,
        matching: find.text("t"),
      );

      expect(appBarTitleFinder, findsOneWidget);
    });

    // ====================== by Type =====================
    testWidgets('Test by Type', (WidgetTester tester) async {
      await tester.pumpWidget(MyWidget(title: 't', subtitle: "s"));

      Finder typeFinder = find.byType(Center);

      expect(typeFinder, findsOneWidget);
    });

    // ======================== by Widget =====================
    testWidgets('Test widget by instant', (WidgetTester tester) async {
      final Widget icon = Icon(Icons.add);

      await tester.pumpWidget(MyWidget(title: 't', subtitle: 's', icon: icon));

      Finder instantFinder = find.byWidget(icon);

      expect(instantFinder, findsOneWidget);
    });
  });
}
