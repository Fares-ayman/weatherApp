/* import 'package:wallpaper_app/modules/home/data/model/collection_model.dart';
import 'package:wallpaper_app/modules/home/data/model/photo_model.dart';
import 'package:wallpaper_app/modules/home/domain/entity/collection_entity.dart';
import 'package:wallpaper_app/modules/home/domain/entity/photo_entity.dart';

extension CollectionItemModelMapper on CollectionItemModel? {
  CollectionItemEntity toDomain() {
    return CollectionItemEntity(
      this?.id ?? "",
      this?.title ?? "",
    );
  }
}

extension PhotoSrcModelMapper on PhotoSrcModel? {
  PhotoSrcEntity toDomain() {
    return PhotoSrcEntity(
      this?.original ?? "",
      this?.large ?? "",
      this?.portrait ?? "",
    );
  }
}

extension PhotoItemModelMapper on PhotoItemModel? {
  PhotoItemEntity toDomain() {
    return PhotoItemEntity(
      this?.id ?? 0,
      this?.url ?? "",
      this?.photographer ?? "",
      this?.avgColor ?? "",
      this?.src.toDomain() ?? PhotoSrcEntity("", "", ""),
      this?.alt ?? "",
    );
  }
}
 */

import 'package:weather_app_gst/modules/home/data/model/clouds_model.dart';
import 'package:weather_app_gst/modules/home/domain/entity/clouds_entity.dart';

import '../../modules/home/data/model/coord_model.dart';
import '../../modules/home/data/model/current_weather_data_model.dart';
import '../../modules/home/data/model/five_days_data_model.dart';
import '../../modules/home/data/model/main_weather_model.dart';
import '../../modules/home/data/model/sys_model.dart';
import '../../modules/home/data/model/weather_model.dart';
import '../../modules/home/data/model/wind_model.dart';
import '../../modules/home/domain/entity/coord_entity.dart';
import '../../modules/home/domain/entity/current_weather_data_entity.dart';
import '../../modules/home/domain/entity/five_days_data_entity.dart';
import '../../modules/home/domain/entity/main_weather_entity.dart';
import '../../modules/home/domain/entity/sys_entity.dart';
import '../../modules/home/domain/entity/weather_entity.dart';
import '../../modules/home/domain/entity/wind_entity.dart';

extension CloudsModelMapper on CloudsModel? {
  CloudsEntity toDomain() {
    return CloudsEntity(
      all: this?.all,
    );
  }
}

extension CoordModelMapper on CoordModel? {
  CoordEntity toDomain() {
    return CoordEntity(
      lat: this?.lat,
      lon: this?.lon,
    );
  }
}

extension FiveDayDataModelMapper on FiveDayDataModel? {
  FiveDayDataEntity toDomain() {
    return FiveDayDataEntity(
      dateTime: this?.dateTime,
      temp: this?.temp,
    );
  }
}

extension MainWeatherModelMapper on MainWeatherModel? {
  MainWeatherEntity toDomain() {
    return MainWeatherEntity(
      feelsLike: this?.feelsLike,
      humidity: this?.humidity,
      pressure: this?.pressure,
      temp: this?.temp,
      tempMax: this?.tempMax,
      tempMin: this?.tempMin,
    );
  }
}

extension SysModelMapper on SysModel? {
  SysEntity toDomain() {
    return SysEntity(
      country: this?.country,
      id: this?.id,
      sunrise: this?.sunrise,
      sunset: this?.sunset,
      type: this?.type,
    );
  }
}

extension WeatherModelMapper on WeatherModel? {
  WeatherEntity toDomain() {
    return WeatherEntity(
      description: this?.description,
      icon: this?.icon,
      id: this?.id,
      main: this?.main,
    );
  }
}

extension WindModelMapper on WindModel? {
  WindEntity toDomain() {
    return WindEntity(
      deg: this?.deg,
      speed: this?.speed,
    );
  }
}

extension CurrentWeatherDataModelMapper on CurrentWeatherDataModel? {
  CurrentWeatherDataEntity toDomain() {
    List<WeatherEntity>? weatherEntity =
        this?.weather?.map((model) => model.toDomain()).toList();
    return CurrentWeatherDataEntity(
      id: this?.id,
      base: this?.base,
      clouds: this?.clouds.toDomain(),
      cod: this?.cod,
      coord: this?.coord.toDomain(),
      dt: this?.dt,
      main: this?.main.toDomain(),
      name: this?.name,
      sys: this?.sys.toDomain(),
      timezone: this?.timezone,
      visibility: this?.visibility,
      wind: this?.wind.toDomain(),
      weather: weatherEntity,
    );
  }
}
