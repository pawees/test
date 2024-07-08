import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/api/json_placeholder_client.dart';
import 'package:test_task/feature/datasource/_dto/comment.dart';
import 'package:test_task/feature/datasource/cache/posts_details_cache.dart';
import 'package:test_task/feature/datasource/repositories/posts_repository.dart';
import 'package:test_task/feature/domain/entities/post_detailed_entity.dart';
import 'package:test_task/feature/domain/i_datasource/i_cache_datasource.dart';
import 'package:test_task/feature/domain/i_datasource/i_datasource.dart';
import 'package:test_task/feature/domain/i_repositories/I_posts_repository.dart';

void main() {
  group('PostsRepository', () {
    late IApiClient apiClient;
    late IPostsRepository repository;
    late IPostDetailsCache cache;

    setUp(() {
      cache = PostDetailsCache();
      apiClient = JsonPlaceholderApiClient();
      repository = PostsRepository(
        cache: cache,
        remoteDataSource: apiClient,
      );
    });

    group('testRepository', () {
      test('getPosts', () async {
        final result = await repository.getPosts();
        expect(result, isA<List<PostDetailedEntity>>());
      });

      test('get comments', () async {
        // Act
        final result = await repository.getComments(1);

        // Assert
        expect(result, isA<List<Comment>>());
      });

      test('getDetailedPost returns detailed post', () async {
        // Act
        final result = await repository.getDetails(1);

        // Assert
        expect(result, isA<PostDetailedEntity>());
      });
      test('getDetailedPost returns cached post', () async {
        await repository.getDetails(1);
        final result = cache.isContains(1);

        // Assert
        expect(result, true);
      });
    });
  });
}
