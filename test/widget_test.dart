import 'package:flutter_test/flutter_test.dart';
import 'package:haya_care/core/routing/app_router.dart';
import 'package:haya_care/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(HayaCareApp(appRouter: AppRouter()));
  });
}
