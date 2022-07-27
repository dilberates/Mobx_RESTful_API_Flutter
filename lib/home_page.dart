import 'package:flutter/material.dart';
import 'posts_list.dart';
import 'user_store.dart';
import 'users_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MobX Restfull API"),
        ),
        body: UserList(),
    );
  }
}