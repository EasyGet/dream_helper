import 'package:example/router/example_router_handler.dart';
import 'package:example/router/example_router_name.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class ExampleRouterConfiguration {
  static void configuration(FluroRouter router) {
    /// 没有找到
    router.notFoundHandler = ExampleRouterHandler.notFound;

    router.define(ExampleRouterName.listPage + "/:type/:key",
        handler: ExampleRouterHandler.listPage);

    router.define(Navigator.defaultRouteName,
        handler: ExampleRouterHandler.splash);
  }

  static Map<String, WidgetBuilder> routes() {
    var map = <String, WidgetBuilder>{
      ExampleRouterName.listPage: ExampleRouterBuilder.listPage,
      Navigator.defaultRouteName: ExampleRouterBuilder.splash,
    };

    return map;
  }
}
