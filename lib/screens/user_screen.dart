import 'package:assignment_mypos/data/users.dart';
import 'package:flutter/material.dart';

import '../services/users_services.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: FutureBuilder<List<Datatable>?>(
          future: UserService.getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error!'),
              );
            } else if (snapshot.hasData) {
              // print(snapshot.hasData);
              List<Datatable>? users = snapshot.data;
              return ListView.builder(
                  itemCount: users!.length,
                  itemBuilder: (context, index) {
                    Datatable user = users[index];
                    return ListTile(
                      title: Text(user.actualName),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
