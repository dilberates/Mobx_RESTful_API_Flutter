import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/post.dart';
import '../Models/user.dart';

class NetworkService {
  List<User> users = [];
  List<Post> posts = [];

  Future <List<User>> getData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      users = (data['data'] as List).map((json) {
        return User.fromJSON(json);
      }).toList();
      if(users is List){
        return users;
      }else{
        print("List is empty");
      }
    } else {
      print("Error in URL");
    }
  }
  Future <List<Post>> getPosts(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      posts = (data as List).map((json) {
        return Post.fromJSON(json);
      }).toList();
      if (posts is List) {
        return posts;
      } else {
        print("List is empty");
      }
    }
      else{
      print("Error in URL");
    }
  }
}
