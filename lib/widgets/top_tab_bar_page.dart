import 'dart:math';

import 'package:flutter/material.dart';

import 'widget_item.dart';

class TopTabBarPageItem {

  /// 标题 可以设置为空
  final Widget? title;

  /// 顶部-底部 tab item
  final List<WidgetItem> items;

  /// 初始
  final int initialIndex;

  /// 是否可滚动
  final bool? scrollable;

  /// 获取items长度
  int get length => items.length;

  /// 获取是否可以滚动 如果没有设置 取length是否>4
  bool get isScrollable => scrollable ?? length > 4;

  /// construct
  const TopTabBarPageItem(this.items,
      {this.title, this.initialIndex = 0, this.scrollable});
}

///
class TopTabBarPage extends StatefulWidget {

  const TopTabBarPage({Key? key, required this.item}) : super(key: key);

  final TopTabBarPageItem item;

  @override
  _TopTabBarPageState createState() => _TopTabBarPageState();
}

class _TopTabBarPageState extends State<TopTabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  late int length;

  @override
  void initState() {
    super.initState();
    length = widget.item.items.length;
    _controller = TabController(
        vsync: this,
        length: widget.item.length,
        initialIndex: widget.item.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.item.title,
        bottom: TabBar(
          tabs: widget.item.items.map((e) => e.item).toList(),
          isScrollable: widget.item.isScrollable,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children:
        widget.item.items.map((e) => e.widgetBuilder(context)).toList(),
      ),
    );
  }

  void changeIndex(int index) {
    _controller.index =
    index > _controller.length - 1 ? _controller.length - 1 : max(index, 0);
  }
}
