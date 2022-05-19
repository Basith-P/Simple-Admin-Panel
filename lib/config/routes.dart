import 'package:flutter/cupertino.dart';

import '../pages/auth.dart';
import '../pages/home.dart';

const String auth = 'auth';
const String home = 'home';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case auth:
      return CupertinoPageRoute(builder: (_) => const AuthPage());
    case home:
      return CupertinoPageRoute(builder: (_) => const HomePage());
    default:
      return CupertinoPageRoute(builder: (_) => const AuthPage());
  }
}
