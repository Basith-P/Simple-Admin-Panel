import 'package:flutter/material.dart';

import '../config/routes.dart' as routes;
import '../config/app_colors.dart';
import '../api/service.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.id,
    required this.name,
    required this.status,
    this.imgUrl = '',
  }) : super(key: key);

  final int id;
  final String name;
  final String status;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        routes.userDetails,
        arguments: id,
      ),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.primaryLighter,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            status == 'active' ? Colors.green : Colors.grey,
                        radius: 5,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        status,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit_rounded,
                color: Colors.blueGrey[200],
              ),
            ),
            IconButton(
              onPressed: () async {
                bool deleted = await ApiService().deleteUser(id);
                if (deleted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('User deleted'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error deleting user'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.delete_rounded,
                color: Colors.red[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
