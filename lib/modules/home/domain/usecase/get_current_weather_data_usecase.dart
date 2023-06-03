import 'package:dartz/dartz.dart';
import 'package:weather_app_gst/modules/home/domain/repository/home_repository.dart';

import '../../../../core/error/failures.dart';
import '../entity/current_weather_data_entity.dart';

class GetCurrentWeatherDataUseCase {
  final HomeRepository _homeRepository;

  GetCurrentWeatherDataUseCase(this._homeRepository);
  Future<Either<Failures, CurrentWeatherDataEntity>> call(String city) async {
    return await _homeRepository.getCurrentWeatherData(city);
  }
}
