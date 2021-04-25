import 'package:flutter/material.dart';

class Screen {
  final RouteFactory onGenerateRoute;

  final GlobalKey<NavigatorState> navigatorState;

  Screen({
    required this.onGenerateRoute,
    required this.navigatorState,
  });
}
