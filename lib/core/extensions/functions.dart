import '../error/failures.dart';
import '../resourses/strings_manager.dart';

String mapFailureToMessage(Failures failures) {
  switch (failures.runtimeType) {
    case ServerFailure:
      return AppStrings.serverFailureMessage;
    case OfflineFailure:
      return AppStrings.offlineFailureMessage;
    default:
      return "Unexpected Error , Please try again later .";
  }
}
