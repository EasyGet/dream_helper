/// 网络状态
enum NetworkStatus {
  /// 只用使用wifi
  wifi,

  /// 可以使用蜂窝数据
  cellular

}

final String networkStatusSetting = "helper_networkStatusSetting";

final String _wifi = "";

final String _cellular = "";

String networkStatusDescription(NetworkStatus networkStatus) {
  switch (networkStatus) {
    case NetworkStatus.wifi: return _wifi;
    case NetworkStatus.cellular: return _cellular;
  }
}