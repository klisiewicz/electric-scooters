import 'package:bloc/bloc.dart';
import 'package:escooters/src/domain/location/locations.dart';
import 'package:escooters/src/domain/map/map_event.dart';
import 'package:escooters/src/domain/map/map_state.dart';
import 'package:escooters/src/domain/scooter/scooter_repository.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final ScooterRepository _repository;

  MapBloc(this._repository) : assert(_repository != null);

  @override
  MapState get initialState => Ready(Locations.initial());

  void loadScooters() => add(LoadScooters());

  @override
  Stream<MapState> mapEventToState(MapEvent event) async* {
    if (event is LoadScooters) {
      yield Busy(state.map);
      try {
        Iterable<ScooterMarker> markers = await _getMarkers();
        yield (markers.isNotEmpty)
            ? Ready(state.map.setScooters(markers))
            : Error(NoScootersException(), state.map);
      } catch (error) {
        yield Error(error, state.map);
      }
    }
  }

  Future<Iterable<ScooterMarker>> _getMarkers() async {
    final scooters = await _repository.findAll();
    return scooters
        .map(_tryToCreateMarker)
        .where(_markerIsNotNull);
  }

  static ScooterMarker _tryToCreateMarker(scooter) {
    try {
      return ScooterMarker.from(scooter);
    } catch (_) {
      return null;
    }
  }

  static bool _markerIsNotNull(marker) => marker != null;
}
