import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

class NavigationObserver extends AutoRouterObserver implements LoggyType {
  @override
  Loggy<NavigationObserver> get loggy =>
      Loggy<NavigationObserver>('Navigator Loggy');

  @override
  void didPush(Route route, Route? previousRoute) {
    // не обрабатываем всплывающие окна
    if (route.settings.name == null) {
      return;
    }

    loggy.info(
        'New route pushed: <${route.settings.name}>, prev <${previousRoute?.settings.name}>');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // не обрабатываем всплывающие окна
    if (route.settings.name == null) {
      return;
    }

    loggy.info(
        'Route pop: <${previousRoute?.settings.name}>, prev <${route.settings.name}>');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    loggy.info(
        'Tab route re-visited:  ${route.name}, prev <${previousRoute?.name}>');
  }
}
