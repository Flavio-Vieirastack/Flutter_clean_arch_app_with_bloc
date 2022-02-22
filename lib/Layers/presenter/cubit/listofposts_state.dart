part of 'listofposts_cubit.dart';

enum PostsStatus {
  initial,
  loading,
  sucess,
  faliure,
}

@immutable
 class ListofpostsState {
  final PostsStatus status;
  final List<ListPostsEntity>? posts;
  const ListofpostsState({this.status = PostsStatus.initial, this.posts});
}
