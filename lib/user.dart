class User {
  String name, email, avatar, id;

  User({this.name, this.email, this.avatar, this.id});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      name: "${json['first_name'].toString()} ${json['last_name'].toString()}",
      email: json['email'].toString(),
      avatar: json['avatar'].toString(),
      id: json['id'].toString(),
    );
  }
}