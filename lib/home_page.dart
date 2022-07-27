import 'package:flutter/material.dart';
import 'posts_list.dart';
import 'user_store.dart';
import 'users_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MobX API Demo"),
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: 'Kullanıcılar',
              ),
              Tab(
                text: 'Favoriler',
              )
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              UserList(),
              PostsList(),
            ],
          ),
        )
    );
  }
}