import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_gst/core/extensions/functions.dart';
import 'package:weather_app_gst/modules/home/domain/usecase/get_current_weather_data_usecase.dart';

import '../../../domain/entity/current_weather_data_entity.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetCurrentWeatherDataUseCase getCurrentWeatherDataUseCase;
  WeatherCubit({required this.getCurrentWeatherDataUseCase})
      : super(WeatherInitial());

  Future<void> getCurrentWeatherData(String city) async {
    emit(WeatherLoading());

    final weeatherData = await getCurrentWeatherDataUseCase.call(city);

    weeatherData.fold(
      (l) {
        emit(WeatherError(mapFailureToMessage(l)));
      },
      (r) {
        emit(WeatherSuccess(r));
      },
    );
  }
}
