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

  /// construct with [pageController]
  PageControllerViewModel(PageController pageController) : super(pageController);

  /// 获取当前page索引
  int get page =>
      this.scrollController.page != null ? scrollController.page!.round() : 0;

  /// [_pageController] jump to [page]
  /// and notify listener
  void changePage(int page) {
    scrollController.jumpToPage(page);
    notifyListeners();
  }
}
