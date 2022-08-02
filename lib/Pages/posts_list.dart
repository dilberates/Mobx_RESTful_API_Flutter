import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../Models/post.dart';
import '../Stores/post_store.dart';

class PostsList extends StatelessWidget {
  PostStore store = PostStore();

  PostsList(String id) {
    store.getThePosts(id);
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    final future = store.postsListFuture;

    return Scaffold(
      appBar: AppBar(
        title: Text("POSTS"),
      ),
      body: Observer(
        builder: (_) {
          switch (future.status) {
            case FutureStatus.pending:
              return Center(
                child: CircularProgressIndicator(),
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
            case FutureStatus.fulfilled:
              final List<Post> posts = future.result;
              return RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ExpansionTile(
                      title: Text(
                        post.title,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      children: <Widget>[Text(post.body)],
                    );
                  },
                ),
              );
              break;
          }
        },
      ),
    );
  }

  Future _refresh() => store.fetchPosts();
}
