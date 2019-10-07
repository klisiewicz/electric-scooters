import 'package:escooters/src/api/scooter_rest_data_source.dart';
import 'package:escooters/src/domain/scooter/scooter_repository.dart';
import 'package:escooters/src/domain/map/map_bloc.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.factory(Client)
  @Register.factory(ScooterRepository, from: ScooterRestRepository)
  @Register.singleton(MapBloc)
  void configure();
}

T inject<T>([String name]) => Container().resolve<T>(name);

void injectDependencies() => _$Injector().configure();
