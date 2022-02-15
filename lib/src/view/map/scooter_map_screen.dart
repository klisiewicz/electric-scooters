import 'package:escooters/src/di/injector.dart';
import 'package:escooters/src/domain/scooter/scooter_marker.dart';
import 'package:escooters/src/view/map/scooter_map.dart';
import 'package:escooters/src/view/map/scooter_map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patterns/view.dart';

class ScooterMapScreen extends StatefulWidget {
  const ScooterMapScreen({Key key}) : super(key: key);

  @override
  _ScooterMapScreenState createState() => _ScooterMapScreenState();
}

class _ScooterMapScreenState extends State<ScooterMapScreen> {
  final ScooterMapBloc _mapBloc = inject<ScooterMapBloc>();

  @override
  void initState() {
    super.initState();
    _mapBloc.loadElements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-scooters'),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocConsumer<ScooterMapBloc, ViewState>(
        bloc: _mapBloc,
        listener: (context, state) {
          if (state is Failure) _showSnackbar(state.error);
        },
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              ScooterMap(scooters: state.getScooterMarkers()),
              if (state is Loading) const LinearProgressIndicator(),
            ],
          );
        },
      ),
    );
  }

  void _showSnackbar(dynamic error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text('$error'),
        ),
        action: SnackBarAction(
          label: 'RETRY',
          onPressed: _mapBloc.loadElements,
        ),
      ),
    );
  }
}

extension _ViewStateExt on ViewState {
  List<ScooterMarker> getScooterMarkers() =>
      this is Success<List<ScooterMarker>>
          ? (this as Success<List<ScooterMarker>>).data
          : [];
}
