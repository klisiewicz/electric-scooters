import 'package:escooters/src/di/injector.dart';
import 'package:escooters/src/domain/location/locations.dart';
import 'package:escooters/src/domain/map/map_bloc.dart';
import 'package:escooters/src/view/map/scooter_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patterns/base_list.dart';

class ScooterMapScreen extends StatefulWidget {
  @override
  _ScooterMapScreenState createState() => _ScooterMapScreenState();
}

class _ScooterMapScreenState extends State<ScooterMapScreen> {
  final MapBloc _mapBloc = inject<MapBloc>();

  @override
  void initState() {
    super.initState();
    _mapBloc.loadElements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-scooters'),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<MapBloc, ViewState>(
        bloc: _mapBloc,
        builder: (context, state) {
          if (state is Failure) _showSnackbar(context, state.error);
          return Stack(
            children: <Widget>[
              ScooterMap(
                scooters:
                    state is Success<List<ScooterMarker>> ? state.data : [],
              ),
              if (state is Loading) const LinearProgressIndicator(),
            ],
          );
        },
      ),
    );
  }

  void _showSnackbar(BuildContext context, dynamic error) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(error.toString()),
          ),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: _mapBloc.loadElements,
          ),
        ),
      ),
    );
  }
}
