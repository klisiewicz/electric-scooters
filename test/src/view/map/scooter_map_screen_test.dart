import 'package:bloc_test/bloc_test.dart';
import 'package:escooters/src/domain/map/map_bloc.dart';
import 'package:escooters/src/view/map/scooter_map.dart';
import 'package:escooters/src/view/map/scooter_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_patterns/base_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:mockito/mockito.dart';

import '../view_test_util.dart';

class MapBlocMock extends MockBloc<dynamic, ViewState> implements MapBloc {}

void main() {
  MapBloc mapBloc;

  setUpAll(() {
    mapBloc = MapBlocMock();
    kiwi.Container().registerInstance<MapBloc, MapBlocMock>(mapBloc);
  });

  testWidgets(
    'should display scooter map when in Initial state',
    (WidgetTester tester) async {
      // Given:
      when(mapBloc.state).thenReturn(Initial());
      await tester.pumpWidget(
        makeTestableWidget(child: const ScooterMapScreen()),
      );

      // Then:
      expect(find.byType(ScooterMap), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsNothing);
      expect(find.byType(SnackBar), findsNothing);
    },
  );

  testWidgets(
    'should display progress indicator when in Loading state',
    (WidgetTester tester) async {
      // Given:
      when(mapBloc.state).thenReturn(Loading());
      await tester.pumpWidget(
        makeTestableWidget(child: const ScooterMapScreen()),
      );

      // Then:
      expect(find.byType(ScooterMap), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      expect(find.byType(SnackBar), findsNothing);
    },
  );

  testWidgets(
    'should display snackbar when in Error state',
    (WidgetTester tester) async {
      // Given:
      whenListen(
        mapBloc,
        Stream.fromIterable([
          Initial(),
          const Failure('Something went wrong...'),
        ]),
      );
      await tester.pumpWidget(
        makeTestableWidget(child: const ScooterMapScreen()),
      );
      await tester.pumpAndSettle();
      // Then:
      expect(find.byType(ScooterMap), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsNothing);
      expect(find.byType(SnackBar), findsOneWidget);
    },
  );
}
