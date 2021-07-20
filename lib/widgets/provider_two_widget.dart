///
/// package: dream_helper
///
/// fileName: provider_two_widget.dart
/// using two ChangeNotifier -> Consumer2
///
/// author mario
/// created 2021/7/19
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

///
typedef TwoValueWidgetBuilder<T1, T2> = Widget Function(BuildContext, T1, T2, Widget?);

///
class ProviderTwoWidget<T1 extends ChangeNotifier, T2 extends ChangeNotifier> extends StatefulWidget {
  const ProviderTwoWidget(
      {Key? key, required this.t1, required this.t2, required this.twoValueWidgetBuilder, this.child, this.initData})
      : super(key: key);

  /// t1
  final T1 t1;

  /// t2
  final T2 t2;

  /// value builder
  final TwoValueWidgetBuilder<T1, T2> twoValueWidgetBuilder;

  /// child
  final Widget? child;

  /// init data
  final Function(T1, T2)? initData;

  @override
  _ProviderTwoWidgetState<T1, T2> createState() => _ProviderTwoWidgetState<T1, T2>();
}

class _ProviderTwoWidgetState<T1 extends ChangeNotifier, T2 extends ChangeNotifier>
    extends State<ProviderTwoWidget<T1, T2>> {
  /// _t1
  late T1 _t1;

  /// _t2
  late T2 _t2;

  @override
  void initState() {
    _t1 = widget.t1;
    _t2 = widget.t2;
    if (widget.initData != null) widget.initData!.call(_t1, _t2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<T1>.value(value: _t1),
        ChangeNotifierProvider<T2>.value(value: _t2),
      ],
      child: Consumer2<T1, T2>(
        builder: widget.twoValueWidgetBuilder,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _t1.dispose();
    _t2.dispose();
    super.dispose();
  }
}
