import 'package:escooters/src/view/scooter/scooter_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../domain/scooter_test_data.dart';
import '../view_test_util.dart';

void main() {
  testWidgets(
    'should display only scooter name, price and battery level',
    (WidgetTester tester) async {
      // Given:
      await tester.pumpWidget(
        makeTestableWidget(child: const ScooterDetails(validScooter)),
      );

      // Then:
      expect(find.text(validScooter.id), findsNothing);
      expect(find.text(validScooter.name), findsOneWidget);
      expect(find.text(validScooter.price), findsOneWidget);
      expect(find.text(validScooter.timeStamp), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.battery_full), findsOneWidget);
    },
  );
}
