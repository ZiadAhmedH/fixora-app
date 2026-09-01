import 'package:flutter_test/flutter_test.dart';
import 'package:feild_service_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FieldServiceApp());
    await tester.pumpAndSettle();
    // App should render without throwing
    expect(find.byType(FieldServiceApp), findsOneWidget);
  });
}
