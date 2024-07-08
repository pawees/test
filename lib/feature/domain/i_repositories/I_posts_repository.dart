import 'dart:async';
import 'package:test_task/feature/datasource/_dto/comment.dart';
import '../entities/post_detailed_entity.dart';


abstract class IPostsRepository {
 Future<List<PostDetailedEntity>> getPosts();
  FutureOr<PostDetailedEntity> getDetails(int post);
  Future<List<Comment>> getComments(int id);
}
