import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:meteo_bloc/bloc/bloc.dart';
import 'package:meteo_bloc/model/weather.dart';
import 'package:meteo_bloc/services/api_service.dart';

class BlocWeather extends Bloc {
  final StreamController<Weather> _weatherController = StreamController<Weather>();
  Sink<Weather> get sink => _weatherController.sink;
  Stream<Weather> get stream => _weatherController.stream;

  @override
  dispose() => _weatherController.close();

  getWeather(Position position) async {
    final Weather weather = await ApiService(position: position).callApi();
    sink.add(weather);
  }
}