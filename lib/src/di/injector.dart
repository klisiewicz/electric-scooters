import 'package:escooters/src/data/scooter_rest_service.dart';
import 'package:escooters/src/data/scooter_service.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.factory(Client)
  @Register.factory(ScooterService, from: ScooterRestService)
  void configure();
}

T inject<T>([String name]) => Container().resolve<T>(name);

void injectDependencies() => _$Injector().configure();
