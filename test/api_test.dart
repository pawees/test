import 'package:flutter_test/flutter_test.dart';
import 'package:test_task/api/json_placeholder_client.dart';
import 'package:test_task/feature/datasource/_dto/comment.dart';
import 'package:test_task/feature/datasource/_dto/post.dart';
import 'package:test_task/feature/domain/i_datasource/api_result.dart';
import 'package:test_task/feature/domain/i_datasource/i_datasource.dart';

void main() {
  group('PostsRepository', () {
    late IApiClient apiClient;

    setUp(() {
      apiClient = JsonPlaceholderApiClient();
    });

    group('testApiAndRepository', () {
      test('getPosts', () async {
        // final exception = Exception('oops');

        final result = await apiClient.getPosts();

        // Assert
        expect(result, isA<Success<List<Post>>>());
      });
      test('get comments', () async {
        // Act
        final result1 = await apiClient.getComment(1);
        final result2 = await apiClient.getComment(2);

        // Assert
        expect(result1, isA<Success<List<Comment>>>());
        expect(result2, isA<Success<List<Comment>>>());

        // expect(result, equals(1));
      });

      test('getDetailedPost returns detailed post', () async {
        // Act
        final result = await apiClient.getDetails(1);

        // Assert
        expect(result, isA<Success<Post>>());
        // expect(result, equals(1));
      });
      
    });
  });
}
