///
/// dream_helper
///
/// provider_widget.dart
/// TODO: Description of the file
///
/// author lq
/// created 2021/7/19
import 'package:flutter/cupertino.dart'
    show
        BuildContext,
        ChangeNotifier,
        Key,
        State,
        StatefulWidget,
        ValueWidgetBuilder,
        Widget;
import 'package:provider/provider.dart';

///
typedef Value2WidgetBuilder<T1, T2> = Widget Function(
    BuildContext, T1, T2, Widget?);

///
typedef Value3WidgetBuilder<T1, T2, T3> = Widget Function(
    BuildContext, T1, T2, T3, Widget?);

///
typedef Value4WidgetBuilder<T1, T2, T3, T4> = Widget Function(
    BuildContext, T1, T2, T3, T4, Widget?);

///
typedef Value5WidgetBuilder<T1, T2, T3, T4, T5> = Widget Function(
    BuildContext, T1, T2, T3, T4, T5, Widget?);

/// with one [ChangeNotifier]
class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  const ProviderWidget(
      {Key? key,
      required this.viewModel,
      required this.valueWidgetBuilder,
      this.initViewModel,
      this.child})
      : super(key: key);

  final T viewModel;

  final Widget? child;

  final ValueWidgetBuilder<T> valueWidgetBuilder;

  final Function(T viewModel)? initViewModel;

  @override
  _ProviderWidgetState<T> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T>> {
  late T viewModel;

  @override
  void initState() {
    viewModel = widget.viewModel;
    if (widget.initViewModel != null) {
      widget.initViewModel!.call(viewModel);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer(
        builder: widget.valueWidgetBuilder,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}

/// with two [ChangeNotifier]
class Provider2Widget<T1 extends ChangeNotifier, T2 extends ChangeNotifier>
    extends StatefulWidget {
  const Provider2Widget(
      {Key? key,
      required this.t1,
      required this.t2,
      required this.valueWidgetBuilder,
      this.child,
      this.initData})
      : super(key: key);

  /// t1
  final T1 t1;

  /// t2
  final T2 t2;

  /// value builder
  final Value2WidgetBuilder<T1, T2> valueWidgetBuilder;

  /// child
  final Widget? child;

  /// init data
  final Function(T1, T2)? initData;

  @override
  _Provider2WidgetState<T1, T2> createState() =>
      _Provider2WidgetState<T1, T2>();
}

class _Provider2WidgetState<T1 extends ChangeNotifier,
    T2 extends ChangeNotifier> extends State<Provider2Widget<T1, T2>> {
  /// _t1
  late T1 _t1;

  /// _t2
  late T2 _t2;

  @override
  void initState() {
    _t1 = widget.t1;
    _t2 = widget.t2;
    if (widget.initData != null) {
      widget.initData!.call(_t1, _t2);
    }
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
        builder: widget.valueWidgetBuilder,
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

/// with three [ChangeNotifier]
class Provider3Widget<T1 extends ChangeNotifier, T2 extends ChangeNotifier,
    T3 extends ChangeNotifier> extends StatefulWidget {
  const Provider3Widget(
      {Key? key,
      required this.t1,
      required this.t2,
      required this.t3,
      required this.valueWidgetBuilder,
      this.child,
      this.initData})
      : super(key: key);

  /// t1
  final T1 t1;

  /// t2
  final T2 t2;

  /// t3
  final T3 t3;

  /// value builder
  final Value3WidgetBuilder<T1, T2, T3> valueWidgetBuilder;

  /// child
  final Widget? child;

  /// init data
  final Function(T1, T2, T3)? initData;

  @override
  _Provider3WidgetState<T1, T2, T3> createState() =>
      _Provider3WidgetState<T1, T2, T3>();
}

class _Provider3WidgetState<
    T1 extends ChangeNotifier,
    T2 extends ChangeNotifier,
    T3 extends ChangeNotifier> extends State<Provider3Widget<T1, T2, T3>> {
  /// _t1
  late T1 _t1;

  /// _t2
  late T2 _t2;

  /// _t3
  late T3 _t3;

  @override
  void initState() {
    _t1 = widget.t1;
    _t2 = widget.t2;
    _t3 = widget.t3;
    if (widget.initData != null) {
      widget.initData!.call(_t1, _t2, _t3);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<T1>.value(value: _t1),
        ChangeNotifierProvider<T2>.value(value: _t2),
        ChangeNotifierProvider<T3>.value(value: _t3)
      ],
      child: Consumer3<T1, T2, T3>(
        builder: widget.valueWidgetBuilder,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _t1.dispose();
    _t2.dispose();
    _t3.dispose();
    super.dispose();
  }
}

/// with four [ChangeNotifier]
class Provider4Widget<
    T1 extends ChangeNotifier,
    T2 extends ChangeNotifier,
    T3 extends ChangeNotifier,
    T4 extends ChangeNotifier> extends StatefulWidget {
  const Provider4Widget(
      {Key? key,
      required this.t1,
      required this.t2,
      required this.t3,
      required this.t4,
      required this.valueWidgetBuilder,
      this.child,
      this.initData})
      : super(key: key);

  /// t1
  final T1 t1;

  /// t2
  final T2 t2;

  /// t3
  final T3 t3;

  /// t4
  final T4 t4;

  /// value builder
  final Value4WidgetBuilder<T1, T2, T3, T4> valueWidgetBuilder;

  /// child
  final Widget? child;

  /// init data
  final Function(T1, T2, T3, T4)? initData;

  @override
  _Provider4WidgetState<T1, T2, T3, T4> createState() =>
      _Provider4WidgetState<T1, T2, T3, T4>();
}

class _Provider4WidgetState<
    T1 extends ChangeNotifier,
    T2 extends ChangeNotifier,
    T3 extends ChangeNotifier,
    T4 extends ChangeNotifier> extends State<Provider4Widget<T1, T2, T3, T4>> {
  /// _t1
  late T1 _t1;

  /// _t2
  late T2 _t2;

  /// _t3
  late T3 _t3;

  /// _t4
  late T4 _t4;

  @override
  void initState() {
    _t1 = widget.t1;
    _t2 = widget.t2;
    _t3 = widget.t3;
    _t4 = widget.t4;
    if (widget.initData != null) {
      widget.initData!.call(_t1, _t2, _t3, _t4);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<T1>.value(value: _t1),
        ChangeNotifierProvider<T2>.value(value: _t2),
        ChangeNotifierProvider<T3>.value(value: _t3),
        ChangeNotifierProvider<T4>.value(value: _t4),
      ],
      child: Consumer4<T1, T2, T3, T4>(
        builder: widget.valueWidgetBuilder,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _t1.dispose();
    _t2.dispose();
    _t3.dispose();
    _t4.dispose();
    super.dispose();
  }
}

/// with five [ChangeNotifier]
class Provider5Widget<
    T1 extends ChangeNotifier,
    T2 extends ChangeNotifier,
    T3 extends ChangeNotifier,
    T4 extends ChangeNotifier,
    T5 extends ChangeNotifier> extends StatefulWidget {
  const Provider5Widget(
      {Key? key,
      required this.t1,
      required this.t2,
      required this.t3,
      required this.t4,
      required this.t5,
      required this.valueWidgetBuilder,
      this.child,
      this.initData})
      : super(key: key);

  /// t1
  final T1 t1;

  /// t2
  final T2 t2;

  /// t3
  final T3 t3;

  /// t4
  final T4 t4;

  /// t5
  final T5 t5;

  /// value builder
  final Value5WidgetBuilder<T1, T2, T3, T4, T5> valueWidgetBuilder;

  /// child
  final Widget? child;

  /// init data
  final Function(T1, T2, T3, T4, T5)? initData;

  @override
  _Provider5WidgetState<T1, T2, T3, T4, T5> createState() =>
      _Provider5WidgetState<T1, T2, T3, T4, T5>();
}

class _Provider5WidgetState<
        T1 extends ChangeNotifier,
        T2 extends ChangeNotifier,
        T3 extends ChangeNotifier,
        T4 extends ChangeNotifier,
        T5 extends ChangeNotifier>
    extends State<Provider5Widget<T1, T2, T3, T4, T5>> {
  /// _t1
  late T1 _t1;

  /// _t2
  late T2 _t2;

  /// _t3
  late T3 _t3;

  /// _t4
  late T4 _t4;

  /// _t5
  late T5 _t5;

  @override
  void initState() {
    _t1 = widget.t1;
    _t2 = widget.t2;
    _t3 = widget.t3;
    _t4 = widget.t4;
    _t5 = widget.t5;
    if (widget.initData != null) {
      widget.initData!.call(_t1, _t2, _t3, _t4, _t5);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<T1>.value(value: _t1),
        ChangeNotifierProvider<T2>.value(value: _t2),
        ChangeNotifierProvider<T3>.value(value: _t3),
        ChangeNotifierProvider<T4>.value(value: _t4),
        ChangeNotifierProvider<T5>.value(value: _t5)
      ],
      child: Consumer5<T1, T2, T3, T4, T5>(
        builder: widget.valueWidgetBuilder,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _t1.dispose();
    _t2.dispose();
    _t3.dispose();
    _t4.dispose();
    _t5.dispose();
    super.dispose();
  }
}
