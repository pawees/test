import 'dart:async';

import 'package:test_task/feature/datasource/_dto/comment.dart';
import 'package:test_task/feature/datasource/_dto/post.dart';
import 'package:test_task/feature/datasource/_mappers/post_mapper.dart';
import 'package:test_task/feature/domain/i_datasource/api_result.dart';
import 'package:test_task/feature/domain/i_datasource/i_cache_datasource.dart';

import '../../domain/entities/post_detailed_entity.dart';
import '../../domain/i_datasource/i_datasource.dart';
import '../../domain/i_repositories/I_posts_repository.dart';

class PostsRepository implements IPostsRepository {
  final IApiClient remoteDataSource;
  final IPostDetailsCache cache;

  PostsRepository({
    required this.remoteDataSource,
    required this.cache,
  });

  @override
  FutureOr<PostDetailedEntity> getDetails(int postId) async {
    if (cache.isContains(postId)) {
      try {
        return cache.getDetailedPost(postId) ?? cache.empty();
      } on Exception catch (e, st) {
        throw Failed(e);
      }
    } else {
      try {
        final Success<Post> postDetails =
            await remoteDataSource.getDetails(postId) as Success<Post>;
        final Success<List<Comment>> comments =
            await remoteDataSource.getComment(postId) as Success<List<Comment>>;
        PostDetailedEntity post =
            PostMapper.fromDTO(postDetails.data, comments.data);
        cache.setDetailedPost(postId, post);
        return post;
      } on Exception catch (e, st) {
        throw Failed(e);
      }
    }
  }

  @override
  Future<List<PostDetailedEntity>> getPosts() async {
    try {
      final Success<List<Post>> postDetails =
          await remoteDataSource.getPosts() as Success<List<Post>>;
      return postDetails.data.map((item) => PostMapper.fromDTO(item)).toList();
    } on Exception catch (e, st) {
      throw Failed(e);
    }
  }

  @override
  Future<List<Comment>> getComments(int id) async {
    try {
      final Success<List<Comment>> comments =
          await remoteDataSource.getComment(id) as Success<List<Comment>>;
      return comments.data;
    } on Exception catch (e, st) {
      throw Failed(e);
    }
  }

  
}
