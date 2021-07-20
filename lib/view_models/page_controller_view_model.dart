///
/// package: dream_helper
///
/// fileName: page_controller_view_model.dart
/// PageControllerViewModel
///
/// author mario
/// created 2021/7/19
import 'package:flutter/cupertino.dart' show PageController;

import 'controller_view_model.dart';

/// PageControllerViewModel
class PageControllerViewModel extends ControllerViewModel<PageController> {
  int _current;

  /// construct with [pageController]
  PageControllerViewModel(PageController pageController, {int current = 0})
      : _current = current,
        super(pageController);

  /// 获取当前page索引
  int get page => _current;

  /// [_pageController] jump to [page]
  /// and notify listener
  void changePage(int page) {
    _current = page;
    scrollController.jumpToPage(page);
    notifyListeners();
  }
}
