import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
    );
  }
}
