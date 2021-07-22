import 'package:flutter/cupertino.dart' show Widget, IndexedWidgetBuilder;

class IndexedWidgetItem {
  /// tabBarItem
  Widget item;

  /// builder for body
  IndexedWidgetBuilder indexedWidgetBuilder;

  /// construct
  IndexedWidgetItem(this.item, this.indexedWidgetBuilder);
}