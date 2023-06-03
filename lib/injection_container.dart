import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app_gst/core/network/client.dart';
import 'package:weather_app_gst/core/network/netwoek_info.dart';
import 'package:weather_app_gst/modules/home/data/datasource/remote_datasource.dart';
import 'package:weather_app_gst/modules/home/data/datasource/remote_datasource_impl.dart';
import 'package:weather_app_gst/modules/home/data/repository/home_repository_impl.dart';
import 'package:weather_app_gst/modules/home/domain/repository/home_repository.dart';
import 'package:weather_app_gst/modules/home/domain/usecase/get_current_weather_data_usecase.dart';
import 'package:weather_app_gst/modules/home/domain/usecase/get_five_days_data_usecase.dart';
import 'package:weather_app_gst/modules/home/presentation/bloc/five_days/five_days_cubit.dart';
import 'package:weather_app_gst/modules/home/presentation/bloc/weather/weather_cubit.dart';

import 'core/network/network_info_impl.dart';
import 'core/resourses/constants_manager.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => WeatherCubit(getCurrentWeatherDataUseCase: sl()));
  sl.registerFactory(() => FiveDaysCubit(get1fiveDaysDataUseCase: sl()));

  sl.registerLazySingleton(
    () => Dio().initClient(AppConstants.baseUrl),
  );

  sl.registerLazySingleton(() => GetCurrentWeatherDataUseCase(sl()));
  sl.registerLazySingleton(() => Get1fiveDaysDataUseCase(sl()));

  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
