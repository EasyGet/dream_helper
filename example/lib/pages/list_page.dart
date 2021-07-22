import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Key,
        Widget,
        IndexedWidgetBuilder,
        BuildContext,
        Scaffold,
        AppBar,
        Builder,
        ListView;

class ListPage extends StatelessWidget {
  const ListPage(
      {Key? key, this.title, required this.itemBuilder, this.count = 0})
      : super(key: key);

  /// 标题
  final Widget? title;

  /// ListItem 创建
  final IndexedWidgetBuilder itemBuilder;

  /// 数量
  final int count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: Builder(builder: (context) {
        return ListView.builder(
          itemBuilder: (context, index) => itemBuilder(context, index),
          itemCount: count,
        );
      }),
    );
  }
}
