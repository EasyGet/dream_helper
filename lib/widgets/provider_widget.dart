///
/// dream_helper
///
/// provider_widget.dart
/// TODO: Description of the file
///
/// author lq
/// created 2021/7/19
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  const ProviderWidget(
      {Key? key, required this.viewModel, required this.valueWidgetBuilder, this.initViewModel, this.child})
      : super(key: key);

  final T viewModel;

  final Widget? child;

  final ValueWidgetBuilder<T> valueWidgetBuilder;

  final Function(T viewModel)? initViewModel;

  @override
  _ProviderWidgetState<T> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier> extends State<ProviderWidget<T>> {
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
