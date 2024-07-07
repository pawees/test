import '../../domain/i_datasource/i_cache_datasource.dart';

class PostDetailsCache implements IPostDetailsCache {
  final Map<int, Map<String, dynamic>> _cache = {};

  // Именованный конструктор empty
  PostDetailsCache.empty();

  @override
  Map<String, dynamic>? getDetailedPost(int postId) {
    return _cache[postId];
  }

  @override
  void setDetailedPost(int postId, Map<String, dynamic> postDetails) {
    _cache[postId] = postDetails;
  }

  @override
  void clear() {
    _cache.clear();
  }
}
