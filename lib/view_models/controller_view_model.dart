import 'package:flutter/cupertino.dart' show ScrollController, ChangeNotifier, Curves;

///
class ControllerViewModel<T extends ScrollController> extends ChangeNotifier {

  /// 位移
  double offset = 0;

  /// 变更
  T scrollController;

  /// construct
  ControllerViewModel(this.scrollController);

  /// 跳转
  void changeOffset(double offset) {
    this.offset = offset;
    scrollController.animateTo(offset,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
    notifyListeners();
  }
}
