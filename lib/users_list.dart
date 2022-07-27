import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'user.dart';
import 'user_store.dart';

class UserList extends StatelessWidget {
  UserStore store = UserStore();

  UserList() {
    store.getTheUsers();
  }

  @override
  Widget build(BuildContext context) {
    final future = store.userListFuture;
    return Observer(
      builder: (_) {
        switch (future.status) {
          case FutureStatus.pending:
            return Center(
              child: CircularProgressIndicator(),
            );
          case FutureStatus.fulfilled:
            final List<User> users = future.result;
            print(users);
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    leading:
                    Image.network(user.avatar),
                    title: Text(
                      user.name,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      user.email,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    onTap: (){

                    },
                    trailing:Icon(Icons.star
                    ),
                  );
                },
              ),
            );
          case FutureStatus.rejected:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Failed to load items.',
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text('Tap to retry'),
                    onPressed: _refresh,
                  )
                ],
              ),
            );
            break;
        }
      },
    );
  }

  Future _refresh() => store.fetchUsers();
}