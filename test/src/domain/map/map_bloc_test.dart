import 'package:escooters/src/domain/location/locations.dart';
import 'package:escooters/src/domain/map/map_bloc.dart';
import 'package:escooters/src/domain/map/map_state.dart';
import 'package:escooters/src/domain/scooter/scooter_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../scooter/scooter_test_data.dart';

class ScooterDataSourceMock extends Mock implements ScooterRepository {}

void main() {
  MapBloc mapBloc;
  ScooterRepository repository;

  setUp(() {
    repository = ScooterDataSourceMock();
    mapBloc = MapBloc(repository);
  });

  void givenRepositoryWithValidScooters() => when(repository.findAll())
      .thenAnswer((_) async => [validScooter, validScooter]);

  void givenRepositoryWithValidAndInvalidScooters() =>
      when(repository.findAll()).thenAnswer(
          (_) async => [validScooter, invalidScooter, validScooter]);

  void givenEmptyRepository() =>
      when(repository.findAll()).thenAnswer((_) async => []);

  void givenFailingRepository() =>
      when(repository.findAll()).thenThrow(_unknownError);

  void whenLoadingScooters() => mapBloc.loadScooters();

  Future<void> thenExpectStates(Iterable<MapState> states) async => expect(
        mapBloc.state,
        emitsInOrder(states),
      );

  test('should be initialized in Ready state with default location', () {
    thenExpectStates([
      Ready(Locations.initial()),
    ]);
  });

  test('should emit Ready state with scooter markers', () {
    givenRepositoryWithValidScooters();

    whenLoadingScooters();

    thenExpectStates([
      Ready(),
      Busy(),
      Ready(Locations.initial().setScooters([_validMarker, _validMarker])),
    ]);
  });

  test('should emit Ready state ONLY with valid scooter markers', () {
    givenRepositoryWithValidAndInvalidScooters();

    whenLoadingScooters();

    thenExpectStates([
      Ready(),
      Busy(),
      Ready(Locations.initial().setScooters([_validMarker, _validMarker])),
    ]);
  });

  test('should emit Error state when loading scooters fails', () {
    givenFailingRepository();

    whenLoadingScooters();

    thenExpectStates([
      Ready(),
      Busy(),
      Error(_unknownError),
    ]);
  });

  test('should emit Error state when there are no scooters', () {
    givenEmptyRepository();

    whenLoadingScooters();

    thenExpectStates([
      Ready(),
      Busy(),
      Error(_noScootersError),
    ]);
  });
}

final _validMarker = ScooterMarker.from(validScooter);
final _unknownError = Exception('Sorry my lord, I have failed');
final _noScootersError = NoScootersException();
