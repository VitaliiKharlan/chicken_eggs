import 'package:chicken_eggs/chicken_eggs_app.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Chicken Eggs App', (WidgetTester tester) async {
    await tester.pumpWidget(const ChickenEggsApp());
  });
}
