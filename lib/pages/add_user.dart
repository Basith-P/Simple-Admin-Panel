import 'package:flutter/material.dart';

import '../config/routes.dart' as routes;
import '../api/service.dart';
import '../config/app_colors.dart';
import '../models/user_model.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController genderController = TextEditingController();

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
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: genderController,
              decoration:
                  const InputDecoration(labelText: 'Gender (male/female)'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (nameController.text.isNotEmpty &&
              emailController.text.isNotEmpty &&
              (genderController.text.toLowerCase() == 'male' ||
                  genderController.text.toLowerCase() == 'female')) {
            final newUser = User(
              id: 0,
              name: nameController.text,
              email: emailController.text,
              gender: genderValues.map[genderController.text.toLowerCase()],
              status: statusValues.map['active'],
            );
            dynamic response = '';
            try {
              response = await ApiService().addUser(newUser);
            } catch (e) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.toString()),
                ),
              );
            }
            if (response == true) {
              Navigator.pushNamedAndRemoveUntil(
                  context, routes.home, (route) => false);
            } else {
              print(response);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(response.toString()),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please check the enterd values'),
              ),
            );
          }
        },
        child: const Icon(
          Icons.check_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
