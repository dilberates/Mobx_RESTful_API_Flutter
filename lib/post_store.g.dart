// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostStore on _PostStore, Store {
 final _$postsListFutureAtom =
      Atom(name: '_PostStore.postsListFuture');

  @override
  ObservableFuture<List<Post>> get postsListFuture {
    _$postsListFutureAtom.reportRead();
    return super.postsListFuture;
  }

  @override
  set postsListFuture(ObservableFuture<List<Post>> value) {
    _$postsListFutureAtom.reportWrite(value, super.postsListFuture, () {
      super.postsListFuture = value;
    });
  }
  final _$_PostStoreActionController =
      ActionController(name: '_PostStore');

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo =
        _$_PostStoreActionController.startAction(name: '_PostStore.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_PostStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postsListFuture: ${postsListFuture}
    ''';
  }
}
