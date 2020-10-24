// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => Client());
    container.registerFactory<ScooterRepository>(
        (c) => ScooterRestRepository(c<Client>()));
    container.registerSingleton((c) => MapBloc(c<ScooterRepository>()));
  }
}
