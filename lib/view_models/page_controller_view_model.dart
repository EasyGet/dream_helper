///
/// package: dream_helper
///
/// fileName: page_controller_view_model.dart
/// TODO: Description of the file
///
/// author mario
/// created 2021/7/19
import 'package:flutter/cupertino.dart' show ChangeNotifier, PageController;

/// PageControllerViewModel
class PageControllerViewModel extends ChangeNotifier {
  ///
  PageController _pageController;

  /// construct with [_pageController]
  PageControllerViewModel(this._pageController);

  int get page => _pageController.page != null ? _pageController.page!.round() : 0;

  /// [_pageController] jump to [page]
  /// and notify listener
  void changePage(int page) {
    _pageController.jumpToPage(page);
    notifyListeners();
  }
}
