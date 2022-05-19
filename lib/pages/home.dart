import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../widgets/user_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 15,
          itemBuilder: (_, i) => UserCard(
            name: 'User $i',
            status: 'active',
          ),
        ),
      ),
    );
  }
}
