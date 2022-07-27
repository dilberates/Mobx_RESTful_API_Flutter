// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
 final _$userListFutureAtom =
      Atom(name: '_UserStore.userListFuture');

  @override
  ObservableFuture<List<User>> get userListFuture {
    _$userListFutureAtom.reportRead();
    return super.userListFuture;
  }

  @override
  set userListFuture(ObservableFuture<List<User>> value) {
    _$userListFutureAtom.reportWrite(value, super.userListFuture, () {
      super.userListFuture = value;
    });
  }

  final _$_UserStoreActionController =
      ActionController(name: '_UserStore');

  @override
  Future<dynamic> fetchUsers() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.fetchUsers');
    try {
      return super.fetchUsers();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userListFuture: ${userListFuture}
    ''';
  }
}
