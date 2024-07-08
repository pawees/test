import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_task/feature/datasource/_dto/comment.dart';
import 'package:test_task/feature/domain/i_datasource/i_datasource.dart';

import '../feature/datasource/_dto/post.dart';
import '../feature/domain/i_datasource/api_result.dart';

class PostDetailsNotFoundFailure implements Exception {}

class PostsNotFoundFailure implements Exception {}


class StatusCodeRequestFailure implements Exception {}




class JsonPlaceholderApiClient implements IApiClient {
  JsonPlaceholderApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'jsonplaceholder.typicode.com';

  final http.Client _httpClient;

  @override
  Future<ApiResult<List<Post>>> getPosts() async {
    final postsRequest = Uri.https(
      _baseUrl,
      '/posts',
    );
    try {
      final response = await _httpClient.get(postsRequest);

      if (response.statusCode != 200) {
        throw Failed(StatusCodeRequestFailure());
      }
      final locationJson = jsonDecode(response.body) as List<dynamic>;


      final results = locationJson.map((map) => Post.fromJson(map)).toList();

      if (results.isEmpty) throw PostsNotFoundFailure();

      return Success(results);

    } on Exception catch (e, st) {
      return Failed(e);
    }
  }

  @override
  Future<ApiResult<Post>> getDetails(int id) async {
    try {
      final request = Uri.https(_baseUrl, '/posts/1', {});
      final response = await _httpClient.get(request);

      if (response.statusCode != 200) {
        throw Failed(StatusCodeRequestFailure());
      }

      final bodyJson = jsonDecode(response.body) as Map<String, dynamic>;

      if (!bodyJson.containsKey('id')) {
        throw PostDetailsNotFoundFailure();
      }

      return Success(Post.fromJson(bodyJson));
    } on Exception catch (e, st) {
      return Failed(e);
    }
  }

  @override
  Future<ApiResult<List<Comment>>> getComment(int id) async {
    try {
      final request = Uri.https(_baseUrl, '/posts/$id/comments', {});

      final response = await _httpClient.get(request);

      if (response.statusCode != 200) {
        throw StatusCodeRequestFailure();
      }

      final bodyJson = jsonDecode(response.body) as List<dynamic>;


      final results = bodyJson.map((map) => Comment.fromJson(map)).toList();

      if (results.isEmpty) throw PostsNotFoundFailure();

      return Success(results);
    } on Exception catch (e, st) {
      return Failed(e);
    }
  }
}
