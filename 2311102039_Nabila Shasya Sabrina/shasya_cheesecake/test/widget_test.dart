import 'package:flutter_test/flutter_test.dart';
import 'package:shasya_cheesecake/main.dart';

void main() {
  testWidgets('Cheesecake app test', (WidgetTester tester) async {
    await tester.pumpWidget(const CheesecakeApp());

    expect(find.text('Cheesecake Store'), findsOneWidget);
  });
}