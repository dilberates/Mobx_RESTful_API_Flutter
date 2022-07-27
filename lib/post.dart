
class Post {
  final String userId,id, title, body;

  Post({this.userId,this.id, this.title, this.body});

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'].toString(),
        id: json['id'].toString(),
        title: json['title'],
        body: json['body']
    );
  }
}