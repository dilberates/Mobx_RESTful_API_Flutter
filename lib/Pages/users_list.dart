import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_restfull_api/Pages/posts_list.dart';

import '../Models/user.dart';
import '../Stores/user_store.dart';

class UserList extends StatelessWidget {
  UserStore store = UserStore();

  UserList() {
    store.getTheUsers();
  }

  @override
  Widget build(BuildContext context) {
    final future = store.userListFuture;
    return Observer(
      // ignore: missing_return
      builder: (_) {
        switch (future.status) {

          case FutureStatus.pending:
            return _pendingUsers();

          case FutureStatus.fulfilled:
            final List<User> users = future.result;
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return _loadUsers(user: user);
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

class _loadUsers extends StatelessWidget {
  const _loadUsers({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(user.avatar),
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
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PostsList(user.id),
        ));
      },
      trailing: Icon(Icons.person),
    );
  }
}

class _pendingUsers extends StatelessWidget {
  const _pendingUsers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
