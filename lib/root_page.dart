import 'package:flutter/material.dart';
import 'package:keepbottombar/app_pages/first_page.dart';
import 'package:keepbottombar/app_pages/pushed_page.dart';
import 'package:keepbottombar/app_pages/second_page.dart';
import 'package:keepbottombar/app_pages/third_page.dart';
import 'screen.dart';

class RootPage {
  getscreens() {
    final Map<int, Screen> _screens = {
      1: Screen(
        navigatorState: GlobalKey<NavigatorState>(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case PushedPage.route:
              return MaterialPageRoute(
                  builder: (_) => PushedPage()); //this route keep bottom bar

            default:
              return MaterialPageRoute(builder: (_) => FirstPage());
          }
        },
      ),
      2: Screen(
        navigatorState: GlobalKey<NavigatorState>(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case PushedPage.route:
              return MaterialPageRoute(builder: (_) => PushedPage());
            default:
              return MaterialPageRoute(builder: (_) => SecondPage());
          }
        },
      ),
      3: Screen(
        navigatorState: GlobalKey<NavigatorState>(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            default:
              return MaterialPageRoute(builder: (_) => ThirdPage());
          }
        },
      ),
    };

    List<Screen> screens = _screens.values.toList();
    return screens;
  }
}
