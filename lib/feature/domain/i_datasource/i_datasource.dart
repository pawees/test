import 'package:test_task/feature/datasource/_dto/post.dart';

import 'api_result.dart';

abstract class IApiClient {
  Future<ApiResult> getPosts();
  Future<ApiResult<Post>> getDetails(int id);
  Future<ApiResult> getComment(int id);
}