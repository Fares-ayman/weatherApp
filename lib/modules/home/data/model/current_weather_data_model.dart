import 'clouds_model.dart';
import 'coord_model.dart';
import 'main_weather_model.dart';
import 'sys_model.dart';
import 'weather_model.dart';
import 'wind_model.dart';

class CurrentWeatherDataModel {
  final CoordModel? coord;
  final List<WeatherModel>? weather;
  final String? base;
  final MainWeatherModel? main;
  final int? visibility;
  final WindModel? wind;
  final CloudsModel? clouds;
  final int? dt;
  final SysModel? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  CurrentWeatherDataModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  factory CurrentWeatherDataModel.fromJson(dynamic json) {
    if (json == null) {
      return CurrentWeatherDataModel();
    }

    return CurrentWeatherDataModel(
      coord: CoordModel.fromJson(json['coord']),
      weather: (json['weather'] as List)
          .map((w) => WeatherModel.fromJson(w))
          .toList(),
      base: json['base'],
      main: MainWeatherModel.fromJson(json['main']),
      visibility: json['visibility'],
      wind: WindModel.fromJson(json['wind']),
      clouds: CloudsModel.fromJson(json['clouds']),
      dt: json['dt'],
      sys: SysModel.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}
