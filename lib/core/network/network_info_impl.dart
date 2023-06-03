import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'netwoek_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImpl(this.internetConnectionChecker);
  @override
  Future<bool> get isContected => internetConnectionChecker.hasConnection;
}
