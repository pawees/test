import 'package:equatable/equatable.dart';
import 'package:test_task/feature/domain/entities/post_detailed_entity.dart';

class PostsEntity extends Equatable {
  final ResponseEntity response;

  const PostsEntity({required this.response});

  static const empty = PostsEntity(
    response: ResponseEntity.empty,

  );

  @override
  List<Object?> get props => [response];
}

class ResponseEntity extends Equatable {
  final int count;

  final List<PostDetailedEntity> posts;

  const ResponseEntity({
    required this.count,
    required this.posts,
  });
  static const empty = ResponseEntity(
    count: 0,
    posts: [],

  );


  @override
  List<Object?> get props => [count, posts];
}
