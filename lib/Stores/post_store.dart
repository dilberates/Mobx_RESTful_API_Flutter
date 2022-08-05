import 'package:mobx/mobx.dart';
import '../Models/post.dart';
import '../Service/network_service.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  final NetworkService httpClient = NetworkService();
  String url = '';

  @observable
  ObservableFuture<List<Post>> postsListFuture;

  @action
  Future fetchPosts() => postsListFuture =
      ObservableFuture(httpClient.getPosts(url).then((posts) => posts));

  void getThePosts(String id) {
    setUrl(id);
    fetchPosts();
  }

  void setUrl(String id) {
    url = 'https://jsonplaceholder.typicode.com/posts?userId=$id';
  }
}
