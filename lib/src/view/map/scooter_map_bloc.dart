import 'package:escooters/src/domain/scooter_marker.dart';
import 'package:escooters/src/domain/scooter_repository.dart';
import 'package:flutter_bloc_patterns/base_list.dart';

class ScooterMapBloc extends ListBloc<ScooterMarker> {
  ScooterMapBloc(ScooterRepository repository) : super(repository);
}
