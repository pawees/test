part of 'posts_cubit.dart';



extension PostsStatusX on PostsStatus {

  bool get isInitial => this == PostsStatus.initial;

  bool get isLoading => this == PostsStatus.loading;

  bool get isSuccess => this == PostsStatus.success;

  bool get isFailure => this == PostsStatus.failure;

}


final class PostsState extends Equatable {
  PostsState( {
    this.status = PostsStatus.initial,
    PostsEntity? posts,
  }) : posts = posts ?? PostsEntity.empty;


  final PostsStatus status;
  final PostsEntity posts;

  PostsState copyWith({
    PostsStatus? status,
    PostsEntity? posts,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object?> get props => [status, posts];
}
