import 'package:equatable/equatable.dart';
import 'package:test_task/feature/datasource/_dto/comment.dart';

import 'comment_entity.dart';

class PostDetailedEntity extends Equatable {
  final String imageUrl;
  final String title;
  final String body;
  final List<Comment> comments;
  const PostDetailedEntity({
    required this.imageUrl,
    required this.title,
    required this.body,
    required this.comments,
  });

  static const empty = PostDetailedEntity(
    imageUrl: '',
    title: '',
    body: '',
    comments: [],
  );

  @override
  List<Object?> get props => [imageUrl, title, body, comments,];
}

