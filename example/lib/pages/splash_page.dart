///
/// plugins
///
/// splash_page.dart
/// 闪屏页
///
/// author lq
/// created 2021/7/15
import 'package:example/router/example_router.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

/// [SplashType.advertise] 广告
/// [SplashType.splash] 闪屏
enum SplashType { advertise, splash }

typedef StringVoid = String Function();

/// SplashPage
/// 闪屏页
class SplashPage extends StatefulWidget {
  const SplashPage(
      {Key? key,
      required this.child,
      required this.duration,
      required this.target,
      this.splashType = SplashType.splash})
      : super(key: key);

  /// [child] display
  final Widget child;

  /// 时间间隔
  final Duration duration;

  final StringVoid target;

  /// [SplashType.advertise] pop back
  /// [SplashType.splash] pushReplacement
  final SplashType splashType;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(widget.duration).then((value) {
      if (mounted)
        switch (widget.splashType) {
          case SplashType.advertise:
            popAction();
            break;
          case SplashType.splash:
            pushAction();
            break;
        }
    });
  }

  /// [SplashType.advertise] 返回
  void popAction() {
    Navigator.of(context).pop();
  }

  /// 根据[target] 的类型弹出不同的内容
  void pushAction() {
    // ExampleRouter.navigateTo(widget.target(), context, replace: true);
    Navigator.of(context).pushReplacementNamed(widget.target(), arguments: {"type": 1111111});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
    );
  }
}
