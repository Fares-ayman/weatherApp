import 'package:dartz/dartz.dart';
import 'package:weather_app_gst/modules/home/domain/repository/home_repository.dart';

import '../../../../core/error/failures.dart';
import '../entity/five_days_data_entity.dart';

class Get1fiveDaysDataUseCase {
  final HomeRepository _homeRepository;

  Get1fiveDaysDataUseCase(this._homeRepository);
  Future<Either<Failures, List<FiveDayDataEntity>>> call(String city) async {
    return await _homeRepository.getFiveDaysData(city);
  }
}
