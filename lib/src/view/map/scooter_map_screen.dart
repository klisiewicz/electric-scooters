import 'package:escooters/src/di/injector.dart';
import 'package:escooters/src/domain/map/map_bloc.dart';
import 'package:escooters/src/domain/map/map_state.dart';
import 'package:escooters/src/view/map/scooter_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScooterMapScreen extends StatefulWidget {
  @override
  _ScooterMapScreenState createState() => _ScooterMapScreenState();
}

class _ScooterMapScreenState extends State<ScooterMapScreen> {
  final MapBloc _mapBloc = inject<MapBloc>();

  @override
  void initState() {
    super.initState();
    _mapBloc.loadScooters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-scooters'),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<MapBloc, MapState>(
        bloc: _mapBloc,
        builder: (context, state) {
          if (state is Error) _showErrorSnackbar(context, state.error);
          return Stack(
            children: <Widget>[
              ScooterMap(state.map),
              if (state is Busy) LinearProgressIndicator(),
            ],
          );
        },
      ),
    );
  }

  void _showErrorSnackbar(BuildContext context, dynamic error) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(error.toString()),
          ),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: _mapBloc.loadScooters,
          ),
        ),
      ),
    );
  }
}
