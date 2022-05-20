import 'package:flutter/cupertino.dart';

import '../pages/auth.dart';
import '../pages/home.dart';
import '../pages/add_user.dart';
import '../pages/user_details_page.dart';

const String auth = 'auth';
const String home = 'home';
const String addUser = 'add-user';
const String userDetails = 'user-details';

Route generateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case auth:
      return CupertinoPageRoute(builder: (_) => const AuthPage());
    case home:
      return CupertinoPageRoute(builder: (_) => const HomePage());
    case addUser:
      return CupertinoPageRoute(builder: (_) => const AddUserPage());
    case userDetails:
      return CupertinoPageRoute(
        builder: (_) => UserDetailsPage(
          id: args as int,
        ),
      );
    default:
      return CupertinoPageRoute(builder: (_) => const AuthPage());
  }
}
