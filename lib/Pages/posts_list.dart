// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../Models/post.dart';
import '../Stores/post_store.dart';


class PostsList extends StatefulWidget {
  PostStore _store = PostStore();
  PostsList(String id){
    _store.getThePosts(id);
  }

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {

  @override
  Widget build(BuildContext context) {
    final future = widget._store.postsListFuture;

    return Scaffold(
      appBar: AppBar(
        title: Text("POSTS"),
      ),
      body: Observer(
        builder: (_) {
          switch (future.status) {
            case FutureStatus.pending:
              return _pendingPost();
            case FutureStatus.rejected:
              return _fail(_refresh);
            case FutureStatus.fulfilled:
              final List<Post> posts = future.result;
              return _loadPosts(posts,_refresh);
              break;
          }
        },
      ),
    );
  }

  Future _refresh() => widget._store.fetchPosts();


}

class _pendingPost extends StatelessWidget {
  const _pendingPost({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
class _loadPosts extends StatelessWidget {
 final  List<Post> posts;
 final Future Function() refresh;
  const _loadPosts(this.posts, this.refresh, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ExpansionTile(
            title: Text(
              post.title,
              style:Theme.of(context).textTheme.bodyText1,
            ),
            children: <Widget>[Text(post.body)],
          );
        },
      ),
    );
  }
}
class _fail extends StatelessWidget {
  final Future Function() refresh;
  const _fail(this.refresh, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Failed to load items.',
            style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.red),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: const Text('Tap to retry'),
            onPressed: refresh,
          )
        ],
      ),
    );
  }
}


