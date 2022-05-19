import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.name,
    required this.status,
    this.imgUrl = '',
  }) : super(key: key);

  final String name;
  final String status;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontSize: 20)),
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
          const SizedBox(width: 10),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit_rounded,
              color: Colors.blueGrey[200],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete_rounded,
              color: Colors.red[400],
            ),
          ),
        ],
      ),
    );
  }
}
