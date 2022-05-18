import 'package:flutter/material.dart';

import 'config/app_theme.dart';
import 'pages/auth.dart';
import 'pages/home.dart';

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
      home: const AuthPage(),
    );
  }
}
