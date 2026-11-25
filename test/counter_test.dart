import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/counter.dart';

main() {
  group("Counter Increment & decrement", () {
    test('Counter value should be incrusted by one', () {
      final Counter counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test("Counter value should be decrement by one", () {
      Counter counter = Counter();
      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
