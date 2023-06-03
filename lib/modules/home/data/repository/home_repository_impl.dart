import 'package:dartz/dartz.dart';
import 'package:weather_app_gst/core/mapper/mapper.dart';
import 'package:weather_app_gst/core/network/netwoek_info.dart';
import 'package:weather_app_gst/modules/home/data/datasource/remote_datasource.dart';
import 'package:weather_app_gst/modules/home/data/model/five_days_data_model.dart';
import 'package:weather_app_gst/modules/home/domain/entity/five_days_data_entity.dart';
import 'package:weather_app_gst/modules/home/domain/entity/current_weather_data_entity.dart';
import 'package:weather_app_gst/modules/home/domain/repository/home_repository.dart';

import '../../../../core/error/failures.dart';
import '../model/current_weather_data_model.dart';

class HomeRepositoryImpl extends HomeRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(this.remoteDataSource, this.networkInfo);
  @override
  Future<Either<Failures, CurrentWeatherDataEntity>> getCurrentWeatherData(
      String city) async {
    if (await networkInfo.isContected) {
      try {
        CurrentWeatherDataModel currentWeatherDataModel =
            await remoteDataSource.getCurrentWeatherData(city);
        CurrentWeatherDataEntity currentWeatherDataEntity =
            currentWeatherDataModel.toDomain();

        return Right(currentWeatherDataEntity);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failures, List<FiveDayDataEntity>>> getFiveDaysData(
      String city) async {
    if (await networkInfo.isContected) {
      try {
        List<FiveDayDataModel> fiveDayDataModel =
            await remoteDataSource.getFiveDaysData(city);
        List<FiveDayDataEntity> fiveDayDataEntity =
            fiveDayDataModel.map((model) => model.toDomain()).toList();

        return Right(fiveDayDataEntity);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
