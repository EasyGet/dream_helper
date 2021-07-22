import 'package:dream_helper/helpers/provider_helper.dart';
import 'package:example/pages/list_page.dart';
import 'package:example/pages/splash_page.dart';
import 'package:example/router/example_router_name.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeModeItem {
  final String title;

  final ThemeMode mode;

  ThemeModeItem(this.title, this.mode);
}

class ExampleRouterHandler {
  static Handler listPage = Handler(handlerFunc: (_, parameter) {
    List<ThemeModeItem> items = [
      ThemeModeItem("系统", ThemeMode.system),
      ThemeModeItem("浅色", ThemeMode.light),
      ThemeModeItem("深色", ThemeMode.dark)
    ];
    return ListPage(itemBuilder: (context, index) {
      var item = items[index];
      return ListTile(
        title: Text(item.title),
        onTap: () {
          Provider.of<ProviderHelper<ThemeMode>>(context)
              .changeValue(item.mode);
        },
      );
    });
  });

  static Handler notFound = Handler(handlerFunc: (_, __) {
    return Scaffold(
      body: Center(
        child: Text("跳转发生错误"),
      ),
    );
  });

  static Handler splash = Handler(handlerFunc: (_, __) {
    return SplashPage(
      child: Center(
        child: Text("welcome"),
      ),
      duration: Duration(seconds: 3),
      target: () => ExampleRouterName.listPage,
    );
  });
}

class ExampleRouterBuilder {
  static WidgetBuilder listPage = (BuildContext context) {
    List<ThemeModeItem> items = [
      ThemeModeItem("系统", ThemeMode.system),
      ThemeModeItem("浅色", ThemeMode.light),
      ThemeModeItem("深色", ThemeMode.dark)
    ];
    return ListPage(
        title: Text("列表"),
        count: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          return ListTile(
            title: Text(item.title),
            onTap: () {
              Provider.of<ProviderHelper<ThemeMode>>(context, listen: false)
                  .changeValue(item.mode);
            },
          );
        });
  };

  static WidgetBuilder splash = (BuildContext context) {
    return SplashPage(
      child: Center(
        child: Text(
          "welcome",
        ),
      ),
      duration: Duration(
        seconds: 3,
      ),
      target: () => ExampleRouterName.listPage,
    );
  };
}
