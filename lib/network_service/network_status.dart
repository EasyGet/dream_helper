import 'package:connectivity/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 网络状态
enum NetworkStatus {
  /// 只用使用wifi
  wifi,

  /// 可以使用蜂窝数据
  cellular,

  /// 全部
  all
}

/// shared_preferences 对应的key值
final String networkStatusSetting = "helper_networkStatusSetting";

/// wifi
final String _wifi = "Wifi";

/// 数据网络
final String _cellular = "Cellular";

/// 全部
final String _all = _wifi + "&" + _cellular;


final String _none = "没有网络";

/// 获取当前网络状态的描述
String connectivityResultDescription(ConnectivityResult networkStatus) {
  switch (networkStatus) {
    case ConnectivityResult.wifi:
      return _wifi;
    case ConnectivityResult.mobile:
      return _cellular;
    case ConnectivityResult.none:
      return _none;
  }
}

Future<ConnectivityResult> currentConnectivityResult() async {
  SharedPreferences shared = await SharedPreferences.getInstance();
  ConnectivityResult result = ConnectivityResult.wifi;
  String? setting = shared.getString(networkStatusSetting);
  if (setting != null) {
    for (var item in ConnectivityResult.values) {
      if (item.toString() == setting) {
        return item;
      }
    }
  }
  shared.setString(networkStatusSetting, result.toString());
  return result;
}

Future<bool> networkAvailable() async {
  ConnectivityResult network = await Connectivity().checkConnectivity();
  ConnectivityResult setting = await currentConnectivityResult();
  if (network == ConnectivityResult.wifi ||
      (network == ConnectivityResult.mobile &&
          setting == ConnectivityResult.mobile)) {
    return true;
  }
  return false;
}
