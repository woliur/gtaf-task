import 'package:connectivity/connectivity.dart';

class NetworkChecker{
  static final instance = NetworkChecker();
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

}