part of 'post_detailed_cubit.dart';


extension PostsStatusX on PostsStatus {
  bool get isInitial => this == PostsStatus.initial;

  bool get isLoading => this == PostsStatus.loading;

  bool get isSuccess => this == PostsStatus.success;

  bool get isFailure => this == PostsStatus.failure;
}

final class PostDetailedState extends Equatable {
  const PostDetailedState(
      {this.status = PostsStatus.initial, PostDetailedEntity? details})
      : details = details ?? PostDetailedEntity.empty;

  final PostsStatus status;
  final PostDetailedEntity details;
  PostDetailedState copyWith({
    PostsStatus? status,
    PostDetailedEntity? details,
  }) {
    return PostDetailedState(
      status: status ?? this.status,
      details: details ?? this.details,
    );
  }

  @override
  List<Object?> get props => [status, details];
}
