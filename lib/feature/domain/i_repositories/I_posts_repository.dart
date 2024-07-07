import 'package:test_task/feature/domain/entities/posts_entity.dart';

import '../entities/post_detailed_entity.dart';


abstract class IPostsRepository {
  Future<PostsEntity> getPosts();
  Future<PostDetailedEntity> getDetails(int post);

}
