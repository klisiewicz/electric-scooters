import 'package:escooters/src/domain/scooter_marker.dart';
import 'package:escooters/src/view/scooter/scooter_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../domain/scooter_test_data.dart';
import '../view_test_util.dart';

void main() {
  final someScooter = ScooterMarker.from(validScooter);

  testWidgets(
    'should display only scooter name, price and battery level',
    (WidgetTester tester) async {
      // Given:
      await tester.pumpWidget(
        makeTestableWidget(child: ScooterDetails(someScooter)),
      );

      // Then:
      expect(find.text(someScooter.id), findsNothing);
      expect(find.text(someScooter.name), findsOneWidget);
      expect(find.text(someScooter.price), findsOneWidget);
      expect(find.text(someScooter.timeStamp), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.battery_full), findsOneWidget);
    },
  );
}
