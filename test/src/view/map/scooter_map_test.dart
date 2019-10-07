import 'package:escooters/src/domain/location/locations.dart';
import 'package:escooters/src/view/map/scooter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../view_test_util.dart';

void main() {
  testWidgets(
    'should display Google Maps',
    (WidgetTester tester) async {
      // Given:
      await tester.pumpWidget(
        makeTestableWidget(
          child: ScooterMap(Locations.initial()),
        ),
      );

      // Then:
      expect(find.byType(GoogleMap), findsOneWidget);
    },
  );
}
