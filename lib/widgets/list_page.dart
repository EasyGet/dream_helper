import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage(
      {Key? key, this.title, required this.itemBuilder, this.count = 0})
      : super(key: key);

  final Widget? title;

  final IndexedWidgetBuilder itemBuilder;

  final int count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: count,
      ),
    );
  }
}
