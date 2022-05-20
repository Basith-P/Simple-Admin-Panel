import 'package:flutter/material.dart';

import '../config/routes.dart' as routes;
import '../api/service.dart';
import '../models/user_model.dart';
import '../widgets/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  getUsers() async {
    setState(() {
      _isLoading = true;
    });
    users = await ApiService().getUsers();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Navigator.pushNamed(context, routes.userDetails, arguments: 2525);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : users.isEmpty
              ? const Center(
                  child: Text(
                  'No users found',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ))
              : ListView.builder(
                  padding: const EdgeInsets.all(10),
                  physics: const BouncingScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (_, i) => UserCard(
                    id: users[i].id,
                    name: users[i].name,
                    status: statusValues.reverse[users[i].status].toString(),
                  ),
                ),
    );
  }
}
