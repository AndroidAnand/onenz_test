import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  NavigationService._privateConstructor();

  static final NavigationService instance = NavigationService._privateConstructor();

  /// Global navigator key that will be used by GoRouter.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? get context => navigatorKey.currentContext;

  /// Push a new route using GoRouter.
  void push(String route) {
    if (context != null) {
      GoRouter.of(context!).push(route);
    }
  }

  /// Pop the current route using GoRouter.
  void pop() {
    if (context != null) {
      GoRouter.of(context!).pop();
    }
  }
}
