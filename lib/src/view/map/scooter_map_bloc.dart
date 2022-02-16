import 'package:escooters/src/domain/scooter.dart';
import 'package:escooters/src/domain/scooter_repository.dart';
import 'package:flutter_bloc_patterns/base_list.dart';

class ScooterMapBloc extends ListBloc<Scooter> {
  ScooterMapBloc(ScooterRepository repository) : super(repository);
}
