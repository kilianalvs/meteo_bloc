class Weather {
  Location? location;
  Current? current;
  Forecast? forecast;

  Weather.fromJson(Map<String, dynamic> json)
      : location = Location.fromJson(json["location"]),
        current = Current.fromJson(json["current"]),
        forecast = Forecast(json["forecast"]);
}

class Location {
  String? name;
  String? region;
  String? country;

  Location.fromJson(Map<String, dynamic> jsonLocation)
      : name = jsonLocation["name"],
        region = jsonLocation["region"],
        country = jsonLocation["country"];
}

class Current {
  Condition? condition;
  double? temperature;
  double? wind;
  String? windDirection;
  double? precipitation;
  int? humidity;
  int? clouds;
  double? feelsLike;
  double? visibility;
  double? uv;

  Current.fromJson(Map<String, dynamic> json)
      : temperature = (json["temp_c"] as num?)?.toDouble(),
        wind = (json["wind_kph"] as num?)?.toDouble(),
        windDirection = json["wind_dir"],
        precipitation = (json["precip_mm"] as num?)?.toDouble(),
        humidity = json["humidity"],
        clouds = json["cloud"],
        feelsLike = (json["feelslike_c"] as num?)?.toDouble(),
        visibility = (json["vis_km"] as num?)?.toDouble(),
        uv = (json["uv"] as num?)?.toDouble(),
        condition = Condition.fromJson(json["condition"]);
}

class Condition {
  String? text;
  String? icon;

  Condition.fromJson(Map<String, dynamic> json)
      : text = json["text"],
        icon = json["icon"];
}

class Forecast {
  List<ForecastDay?> forecastDay = [];

  Forecast(Map<String, dynamic> json) {
    final list = json["forecastday"] as List<dynamic>;
    forecastDay = list
        .map((d) => ForecastDay.fromJson(d as Map<String, dynamic>))
        .toList();
  }
}

class ForecastDay {
  String? date;
  Day? day;

  ForecastDay.fromJson(Map<String, dynamic> json)
      : date = json["date"],
        day = Day.fromJson(json["day"]);
}

class Day {
  double? maxTemp;
  double? minTemp;
  double? wind;
  double? precipitation;
  double? snow;
  double? visibility;
  double? humidity;
  int? chanceRain;
  int? chanceSnow;
  Condition? condition;
  double? uv;

  Day.fromJson(Map<String, dynamic> json)
      : maxTemp = (json["maxtemp_c"] as num?)?.toDouble(),
        minTemp = (json["mintemp_c"] as num?)?.toDouble(),
        wind = (json["maxwind_kph"] as num?)?.toDouble(),
        precipitation = (json["totalprecip_mm"] as num?)?.toDouble(),
        snow = (json["totalsnow_cm"] as num?)?.toDouble(),
        visibility = (json["avgvis_km"] as num?)?.toDouble(),
        humidity = (json["avghumidity"] as num?)?.toDouble(),
        chanceRain = json["daily_chance_of_rain"],
        chanceSnow = json["daily_chance_of_snow"],
        condition = Condition.fromJson(json["condition"]),
        uv = (json["uv"] as num?)?.toDouble();
}