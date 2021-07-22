///
/// plugins
///
/// bottom_tab_bar_page.dart
/// IndexPage
///
/// author lq
/// created 2021/7/16
import 'dart:math';

import "package:flutter/material.dart"
    show
        Widget,
        StatefulWidget,
        Key,
        BuildContext,
        IndexedWidgetBuilder,
        BottomNavigationBarItem,
        State,
        SingleTickerProviderStateMixin,
        PageController,
        NeverScrollableScrollPhysics,
        BottomNavigationBar,
        Scaffold,
        BottomNavigationBarType,
        PageView;

import '../view_models/page_controller_view_model.dart';
import 'provider_widget.dart';

/// IndexPage
///
class BottomTabBarPage<T extends Widget> extends StatefulWidget {
  /// Constructor
  const BottomTabBarPage(
      {Key? key,
      this.initialIndex = 0,
      required this.widgetBuilder,
      required this.items})
      : assert(items.length > 0),
        super(key: key);

  /// 初始索引
  final int initialIndex;

  /// 构建widget
  final IndexedWidgetBuilder widgetBuilder;

  /// bottom items
  final List<BottomNavigationBarItem> items;

  @override
  _BottomTabBarPageState<T> createState() => _BottomTabBarPageState<T>();
}

class _BottomTabBarPageState<T extends Widget> extends State<BottomTabBarPage<T>>
    with SingleTickerProviderStateMixin {
  /// [_pageController]
  late PageController _pageController;

  /// 长度
  late int _length;

  @override
  void initState() {
    super.initState();
    _length = widget.items.length;
    _pageController = PageController(
      initialPage: min(widget.initialIndex, _length - 1),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<PageControllerViewModel>(
      viewModel: PageControllerViewModel(_pageController),
      valueWidgetBuilder: (context, viewModel, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: widget.items,
            type: widget.items.length > 4
                ? BottomNavigationBarType.shifting
                : BottomNavigationBarType.fixed,
            onTap: (index) {
              viewModel.changePage(index);
            },
            currentIndex: viewModel.page,
          ),
          body: PageView.builder(
            itemBuilder: widget.widgetBuilder,
            itemCount: _length,
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
          ),
        );
      },
    );
  }
}
