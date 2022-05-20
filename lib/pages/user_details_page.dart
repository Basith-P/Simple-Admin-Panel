import 'package:flutter/material.dart';

import '../config/routes.dart' as routes;
import 'package:simple_admin_panel/api/service.dart';
import '../config/app_colors.dart';
import '../models/user_model.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({Key? key, required this.id}) : super(key: key);

  final int id;

  //future builder
  Future<Map> getUser() async {
    final user = await ApiService().getUser(id);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: FutureBuilder<Map>(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView(
              children: [
                const SizedBox(height: 10),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primaryLighter,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  snapshot.data!['name'],
                  style: const TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  snapshot.data!['email'],
                  style: const TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error!.toString());
          } else {
            return const Center(
              child: Text('No data'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ApiService().deleteUser(id);
          Navigator.pushNamedAndRemoveUntil(
              context, routes.home, (route) => false);
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
