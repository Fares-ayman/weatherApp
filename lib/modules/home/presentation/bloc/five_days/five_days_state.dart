part of 'five_days_cubit.dart';

abstract class FiveDaysState {}

class FiveDaysInitial extends FiveDaysState {}

class FiveDaysLoading extends FiveDaysState {}

class FiveDaysSuccess extends FiveDaysState {
  final List<FiveDayDataEntity> fiveDayDataEntity;

  FiveDaysSuccess(this.fiveDayDataEntity);
}

class FiveDaysError extends FiveDaysState {
  final String message;

  FiveDaysError(this.message);
}
