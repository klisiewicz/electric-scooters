import 'package:bloc_test/bloc_test.dart';
import 'package:escooters/src/view/map/scooter_map.dart';
import 'package:escooters/src/view/map/scooter_map_bloc.dart';
import 'package:escooters/src/view/map/scooter_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_patterns/base_list.dart';
import 'package:flutter_bloc_patterns/view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:mocktail/mocktail.dart';

import '../view_test_util.dart';

class ScooterMapBlocMock extends MockBloc<ListEvent, ViewState>
    implements ScooterMapBloc {}

// ignore: avoid_implementing_value_types
class ViewStateFake extends Fake implements ViewState {}

// ignore: avoid_implementing_value_types
class ListEventFake extends Fake implements ListEvent {}

void main() {
  late ScooterMapBloc mapBloc;

  setUpAll(() {
    registerFallbackValue(ViewStateFake());
    registerFallbackValue(ListEventFake());
  });

  setUp(() {
    mapBloc = ScooterMapBlocMock();
    kiwi.KiwiContainer().registerInstance<ScooterMapBloc>(mapBloc);
  });

  testWidgets(
    'should display scooter map when in $Initial state',
    (WidgetTester tester) async {
      // Given:
      when(() => mapBloc.state).thenReturn(const Initial());
      await tester.pumpScooterMapScreen();

      // Then:
      thenMapIsDisplayed();
      thenNoProgressIndicatorIsDisplayed();
      thenNoSnackBarIsDisplayed();
    },
  );

  testWidgets(
    'should display progress indicator when in $Loading state',
    (WidgetTester tester) async {
      // Given:
      when(() => mapBloc.state).thenReturn(const Loading());
      await tester.pumpScooterMapScreen();

      // Then:
      thenMapIsDisplayed();
      thenProgressIndicatorIsDisplayed();
      thenNoSnackBarIsDisplayed();
    },
  );

  testWidgets(
    'should display snackbar when in $Failure state',
    (WidgetTester tester) async {
      // Given:
      whenListen(
        mapBloc,
        Stream.fromIterable(
          const [
            Loading(),
            Failure('Something went wrong...'),
          ],
        ),
        initialState: const Initial(),
      );
      await tester.pumpScooterMapScreen();
      await tester.pumpAndSettle();

      // Then:
      thenMapIsDisplayed();
      thenNoProgressIndicatorIsDisplayed();
      thenSnackBarIsDisplayed();
    },
  );

  tearDown(() {
    kiwi.KiwiContainer().clear();
  });
}

void thenMapIsDisplayed() {
  expect(find.byType(ScooterMap), findsOneWidget);
}

void thenProgressIndicatorIsDisplayed() {
  expect(find.byType(LinearProgressIndicator), findsOneWidget);
}

void thenNoProgressIndicatorIsDisplayed() {
  expect(find.byType(LinearProgressIndicator), findsNothing);
}

void thenSnackBarIsDisplayed() {
  expect(find.byType(SnackBar), findsOneWidget);
}

void thenNoSnackBarIsDisplayed() {
  expect(find.byType(SnackBar), findsNothing);
}

extension on WidgetTester {
  Future<void> pumpScooterMapScreen() async {
    await pumpWidget(makeTestableWidget(child: const ScooterMapScreen()));
  }
}
