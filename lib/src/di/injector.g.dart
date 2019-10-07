// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void configure() {
    final Container container = Container();
    container.registerFactory((c) => Client());
    container.registerFactory<ScooterRepository, ScooterRestRepository>(
        (c) => ScooterRestRepository(c<Client>()));
    container.registerSingleton((c) => MapBloc(c<ScooterRepository>()));
  }
}
