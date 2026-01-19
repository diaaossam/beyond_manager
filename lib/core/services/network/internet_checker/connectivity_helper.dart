import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConnectivityHelper {
  final Connectivity connectivity;

  ConnectivityHelper({required this.connectivity});

  /// Returns a stream that emits true when connected, false when disconnected
  Stream<bool> getConnectivityStream() {
    return connectivity.onConnectivityChanged.map((List<ConnectivityResult> results) {
      return results.contains(ConnectivityResult.wifi) ||
          results.contains(ConnectivityResult.mobile);
    });
  }

  /// Check current connectivity status
  Future<bool> checkConnectivity() async {
    final results = await connectivity.checkConnectivity();
    return results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.mobile);
  }
}
