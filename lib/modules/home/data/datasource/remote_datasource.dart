import 'package:weather_app_gst/modules/home/data/model/current_weather_data_model.dart';
import 'package:weather_app_gst/modules/home/data/model/five_days_data_model.dart';

abstract class RemoteDataSource {
  Future<CurrentWeatherDataModel> getCurrentWeatherData(String city);
  Future<List<FiveDayDataModel>> getFiveDaysData(String city);
}
