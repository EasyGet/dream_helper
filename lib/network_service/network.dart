import 'package:dio/dio.dart';

/// 提供网络请求
abstract class Network {

  static const cancelReason = "用户取消";

  /// 网络请求  [future]
  Future<dynamic> request(Future<dynamic> future);


  CancelToken? get cancelToken;

  ///  cancel request
  void cancel({String reason = Network.cancelReason}) {
    if (this.cancelToken != null) {
      this.cancelToken!.cancel();
    }
  }
}

