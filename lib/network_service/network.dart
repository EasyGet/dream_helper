import 'package:dio/dio.dart';

/// 提供网络请求
abstract class Network {
  /// reason
  static const cancelReason = "用户取消";

  /// 网络请求  [future]
  Future<dynamic> request(Future<dynamic> future);

  /// [_cancelToken]
  CancelToken _cancelToken = CancelToken();

  /// [cancelToken] getter
  CancelToken get cancelToken => _cancelToken;

  ///  cancel request
  void cancel({String reason = Network.cancelReason}) {
    this.cancelToken.cancel(reason);
  }
}
