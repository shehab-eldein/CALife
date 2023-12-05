import 'package:flutter/material.dart';

class AppNavigatorObserver extends NavigatorObserver {
  List<BuildContext> contexts = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is MaterialPageRoute) {
      contexts.add(route.subtreeContext!);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (contexts.isNotEmpty) {
      contexts.removeLast();
    }
  }
}