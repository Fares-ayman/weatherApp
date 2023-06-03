import 'package:dartz/dartz.dart';
import 'package:weather_app_gst/core/error/failures.dart';
import 'package:weather_app_gst/modules/home/domain/entity/current_weather_data_entity.dart';
import 'package:weather_app_gst/modules/home/domain/entity/five_days_data_entity.dart';

abstract class HomeRepository {
  Future<Either<Failures, CurrentWeatherDataEntity>> getCurrentWeatherData(
      String city);
  Future<Either<Failures, List<FiveDayDataEntity>>> getFiveDaysData(
      String city);
}
