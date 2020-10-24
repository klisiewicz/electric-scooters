import 'package:escooters/src/data/scooter_rest_repository.dart';
import 'package:escooters/src/domain/scooter/scooter_repository.dart';
import 'package:escooters/src/view/map/scooter_map_bloc.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.factory(Client)
  @Register.factory(ScooterRepository, from: ScooterRestRepository)
  @Register.singleton(ScooterMapBloc)
  void configure();
}

T inject<T>([String name]) => KiwiContainer().resolve<T>(name);

void injectDependencies() => _$Injector().configure();
