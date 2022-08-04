import 'package:mobx/mobx.dart';
import 'package:mobx_restfull_api/enum.dart';

import '../Models/user.dart';
import '../Service/network_service.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  ObservableFuture<List<User>> userListFuture;

  @action
  Future fetchUsers(){
    userListFuture = ObservableFuture(httpClient
        .getData(urlGet(baseUrl.users))
        .then((users) => users));
  }
}

String urlGet(baseUrl url){
  switch(url){
    case baseUrl.users:
      return 'https://reqres.in/api/users?page=1';
      break;
    case baseUrl.posts:  
  }
}
