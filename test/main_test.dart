import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tapp/main.dart';

void main() {
  Calculator calculator = Calculator();
  //Unit testing
  group('Calculator calculation test', () {
    test('adds one to input values', () {
      expect(calculator.add(1, 2), 3);
    });

    test('subtracts one to input values', () {
      expect(calculator.subtract(5, 2), 3);
    });

    test('multiplies one to input values', () {
      expect(calculator.multiply(2, 5), 10);
    });

    test('divides one to input values', () {
      expect(calculator.divide(1, 0), 0);
    });
  });
  //widget testing
  group('Widget Testing', () {
    testWidgets(
      'calculator app should work',
      (tester) async {
        await tester.pumpWidget(const MyApp());
        final textButtonone = find.byKey(const ValueKey('first'));
        final textButtontwo = find.byKey(const ValueKey('second'));
        final iconButtonadd = find.byKey(const ValueKey('add'));
        final resultText = find.byKey(const ValueKey('result'));
        final addResult = find.text('6');
        await tester.enterText(textButtonone, '2');
        await tester.enterText(textButtontwo, '4');
        await tester.tap(iconButtonadd);
        await tester.pump();
        expect(resultText, findsOneWidget);
        expect(addResult, findsOneWidget);
      },
    );
  });
}
