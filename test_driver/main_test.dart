import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../lib/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('add testing', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    final textButtonone = find.byKey(const ValueKey('first'));
    final textButtontwo = find.byKey(const ValueKey('second'));
    final iconButtonadd = find.byKey(const ValueKey('add'));
    await tester.enterText(textButtonone, '2');
    await tester.enterText(textButtontwo, '4');
    await tester.tap(iconButtonadd);
    await tester.pumpAndSettle();
    expect(find.text('6'), findsOneWidget);
  });
}
