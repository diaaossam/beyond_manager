import 'package:flutter/material.dart';

/// Intercepts the system back button and pops the navigator when possible
/// so the app does not close while there are still routes in the stack.
class AppBackButtonDispatcher extends RootBackButtonDispatcher {
  AppBackButtonDispatcher({required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Future<bool> didPopRoute() async {
    final state = navigatorKey.currentState;
    if (state != null && state.canPop()) {
      state.pop();
      return true;
    }
    return super.didPopRoute();
  }
}
