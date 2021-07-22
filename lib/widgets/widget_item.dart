import 'package:flutter/cupertino.dart' show Widget, WidgetBuilder;

class WidgetItem {
  /// tabBarItem
  Widget item;

  /// builder for body
  WidgetBuilder widgetBuilder;

  /// construct
  WidgetItem(this.item, this.widgetBuilder);
}