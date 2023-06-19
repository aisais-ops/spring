import 'package:flutter/widgets.dart';
import 'package:spring/views/login.dart';

class SplashScreenRoutes {
 // static const String login = 'login';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      'login': (context) => LoginLancher(),
    };
  }
}