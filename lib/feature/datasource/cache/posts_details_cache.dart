import 'package:test_task/feature/domain/entities/post_detailed_entity.dart';

import '../../domain/i_datasource/i_cache_datasource.dart';

class PostDetailsCache implements IPostDetailsCache {
  final Map<int, PostDetailedEntity> _cache = {};

  bool isContains( key) {
    return _cache.containsKey(key);
  }

  @override
   PostDetailedEntity empty()  {
    return  PostDetailedEntity.empty;
  }


  @override
  PostDetailedEntity? getDetailedPost(int postId)  {
    return  _cache[postId];
  }

  @override
  void setDetailedPost(int postId, PostDetailedEntity postDetails) {
    _cache[postId] = postDetails;
  }

  @override
  void clear() {
    _cache.clear();
  }
}
