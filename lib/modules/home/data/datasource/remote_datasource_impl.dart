import 'package:dio/dio.dart';
import 'package:weather_app_gst/core/error/exceptions.dart';
import 'package:weather_app_gst/core/resourses/constants_manager.dart';
import 'package:weather_app_gst/modules/home/data/datasource/remote_datasource.dart';
import 'package:weather_app_gst/modules/home/data/model/five_days_data_model.dart';
import 'package:weather_app_gst/modules/home/data/model/current_weather_data_model.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final Dio client;

  RemoteDataSourceImpl(this.client);

  @override
  Future<CurrentWeatherDataModel> getCurrentWeatherData(String city) async {
    final result = await client.get(
      AppConstants.weather,
      queryParameters: {
        "q": city,
        "lang": "en",
        "appid": AppConstants.apiKey,
      },
    );

    if (result.statusCode == AppConstants.successStatusCode) {
      final resultFromJson = CurrentWeatherDataModel.fromJson(result.data);
      return resultFromJson;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<FiveDayDataModel>> getFiveDaysData(String city) async {
    final result = await client.get(
      AppConstants.forecast,
      queryParameters: {
        "q": city,
        "lang": "en",
        "appid": AppConstants.apiKey,
      },
    );

    if (result.statusCode == AppConstants.successStatusCode) {
      final resultFromJson = (result.data['list'] as List)
          .map((dayData) => FiveDayDataModel.fromJson(dayData))
          .toList();
      return resultFromJson;
    } else {
      throw ServerException();
    }
  }
}
