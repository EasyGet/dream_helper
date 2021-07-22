import 'package:dream_helper/network_service/network.dart';

///
/// package: dream_helper
///
/// fileName: base_view_model.dart
/// BaseViewModel
///
/// author mario
/// created 2021/7/19

class BaseViewModel<T extends Network> {
  /// 网络请求
  T network;

  BaseViewModel(this.network);
}
