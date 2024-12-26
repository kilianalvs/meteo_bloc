import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meteo_bloc/bloc/bloc_provider.dart';
import 'package:meteo_bloc/bloc/bloc_weather.dart';
import 'package:meteo_bloc/model/weather.dart';
import 'package:meteo_bloc/ui/current_infos.dart';

class WeatherWidget extends StatelessWidget {
  final Position position;
  const WeatherWidget({super.key, required this.position});



  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocWeather>(context);
    bloc?.getWeather(position);

    return StreamBuilder<Weather>(
        stream: bloc?.stream,
        builder: (context, snapshot) {
          return (!snapshot.hasData)
              ? const Text("Rien à montrer pour le moment")
              : Column(
            children: [
              CurrentInfos(location: snapshot.data?.location, current: snapshot.data?.current)

            ],
          );
        }
    );
  }
}