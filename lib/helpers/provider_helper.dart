import 'package:flutter/cupertino.dart' show ChangeNotifier;

/// ProviderHelper 范型类
class ProviderHelper<T> extends ChangeNotifier {
  /// 更改的值
  T value;

  /// construct
  ProviderHelper({T? value, T? defaultValue})
      : assert(value != null || defaultValue != null),
        this.value = value ?? defaultValue!;

  /// 更改值
  void changeValue(T value) {
    this.value = value;
    notifyListeners();
  }
}
