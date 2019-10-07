import 'package:escooters/src/domain/map/map_bloc.dart';
import 'package:escooters/src/domain/map/map_state.dart';
import 'package:escooters/src/view/map/scooter_map.dart';
import 'package:escooters/src/view/map/scooter_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:mockito/mockito.dart';

import '../view_test_util.dart';

class MapBlocMock extends Mock implements MapBloc {}

void main() {
  MapBloc mapBloc;

  setUpAll(() {
    mapBloc = MapBlocMock();
    kiwi.Container().registerInstance<MapBloc, MapBlocMock>(mapBloc);
  });

  testWidgets(
    'should display scooter map when in Ready state',
    (WidgetTester tester) async {
      when(mapBloc.currentState).thenReturn(Ready());
      // Given:
      await tester.pumpWidget(makeTestableWidget(child: ScooterMapScreen()));

      // Then:
      expect(find.byType(ScooterMap), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsNothing);
      expect(find.byType(SnackBar), findsNothing);
    },
  );

  testWidgets(
    'should display progress indicator when in loading state',
    (WidgetTester tester) async {
      when(mapBloc.currentState).thenReturn(Busy());
      // Given:
      await tester.pumpWidget(makeTestableWidget(child: ScooterMapScreen()));

      // Then:
      expect(find.byType(ScooterMap), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      expect(find.byType(SnackBar), findsNothing);
    },
  );

  testWidgets(
    'should display progress indicator when in loading state',
    (WidgetTester tester) async {
      when(mapBloc.currentState).thenReturn(Error('Something went wrong...'));
      // Given:
      await tester.pumpWidget(makeTestableWidget(child: ScooterMapScreen()));
      await tester.pump();
      // Then:
      expect(find.byType(ScooterMap), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsNothing);
      expect(find.byType(SnackBar), findsOneWidget);
    },
  );
}
