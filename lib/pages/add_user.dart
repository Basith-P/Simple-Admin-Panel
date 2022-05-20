import 'package:flutter/material.dart';

import '../config/routes.dart' as routes;
import '../api/service.dart';
import '../config/app_colors.dart';
import '../models/user_model.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = '';
    String email = '';
    String gender = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primaryLighter,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) => name = value,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) => email = value,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) => gender = value,
              decoration: const InputDecoration(labelText: 'Gender'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newUser = User(
            id: 0,
            name: name,
            email: email,
            gender: genderValues.map[gender],
            status: statusValues.map['active'],
          );
          await ApiService().addUser(newUser);
          Navigator.pushNamedAndRemoveUntil(
              context, routes.home, (route) => false);
        },
        child: const Icon(
          Icons.check_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
