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
    required List<PostDetailedEntity> posts,
  }) : posts = posts;


  final PostsStatus status;
  final List<PostDetailedEntity> posts;

  PostsState copyWith({
    PostsStatus? status,
    required List<PostDetailedEntity> posts,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts,
    );
  }

  @override
  List<Object?> get props => [status, posts];
}
