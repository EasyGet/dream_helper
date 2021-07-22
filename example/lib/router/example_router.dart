import 'package:flutter/cupertino.dart';

class ExampleRouter {

  static void navigateTo(String to, BuildContext context,
      {bool replace = false,
      bool clearStack = false,
      bool maintainState = true,
      bool rootNavigator = false,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      RouteSettings? routeSettings}) {
    Navigator.of(context).pushNamed(to);
  }






}
