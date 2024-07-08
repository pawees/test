import 'package:test_task/feature/domain/entities/comment_entity.dart';
import 'package:test_task/feature/domain/entities/post_detailed_entity.dart';

class PostMapper {
  static PostDetailedEntity fromDTO(data, [comments]) {

    return PostDetailedEntity(
      imageUrl: 'https://placehold.co/600x400/png',
      title: data.title,
      comments: comments ?? [],
      body: data.body,
    );
  }
}
