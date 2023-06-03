import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_gst/core/extensions/functions.dart';
import 'package:weather_app_gst/modules/home/domain/usecase/get_five_days_data_usecase.dart';

import '../../../domain/entity/five_days_data_entity.dart';

part 'five_days_state.dart';

class FiveDaysCubit extends Cubit<FiveDaysState> {
  final Get1fiveDaysDataUseCase get1fiveDaysDataUseCase;
  FiveDaysCubit({required this.get1fiveDaysDataUseCase})
      : super(FiveDaysInitial());

  Future<void> getFiveDaysData(String city) async {
    emit(FiveDaysLoading());

    final fiveDaysData = await get1fiveDaysDataUseCase.call(city);

    fiveDaysData.fold(
      (l) {
        emit(FiveDaysError(mapFailureToMessage(l)));
      },
      (r) {
        emit(FiveDaysSuccess(r));
      },
    );
  }
}
