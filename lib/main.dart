import 'package:flutter/material.dart';

import 'config/app_theme.dart';
import 'config/routes.dart' as routes;

void main() {
  runApp(const AdminPanelApp());
}

class AdminPanelApp extends StatelessWidget {
  const AdminPanelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      onGenerateRoute: routes.generateRoute,
      initialRoute: routes.auth,
    );
  }
}
