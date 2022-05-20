import 'package:flutter/material.dart';

import '../config/routes.dart' as routes;
import 'package:simple_admin_panel/api/service.dart';
import '../config/app_colors.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<Map>(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
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
                        Text(
                          snapshot.data!['name'],
                          style: const TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          snapshot.data!['status'],
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 30),
                  const Text(
                    'Email',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  const SizedBox(height: 5),
                  Text(snapshot.data!['email']),
                  const SizedBox(height: 15),
                  const Text(
                    'Gender',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  const SizedBox(height: 5),
                  Text(snapshot.data!['gender']),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            ApiService().deleteUser(id);
                            Navigator.pushNamedAndRemoveUntil(
                                context, routes.home, (route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 161, 70, 68),
                          ),
                          child: const Text('Delete'),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryLighter,
                          ),
                          child: const Text('Edit'),
                        ),
                      ),
                    ],
                  )
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
      ),
    );
  }
}
