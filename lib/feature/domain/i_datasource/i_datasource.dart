import '../../datasource/_dto/post/comment.dart';
import '../../datasource/_dto/post.dart';
import 'api_result.dart';

abstract class IApiClient {
  Future<ApiResult> getPosts();
  Future<ApiResult> getDetails(int id);
  Future<ApiResult> getComment(int id);
}