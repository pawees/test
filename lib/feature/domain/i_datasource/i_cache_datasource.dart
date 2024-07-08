import 'package:test_task/feature/domain/entities/post_detailed_entity.dart';

abstract class IPostDetailsCache {
  bool isContains(int postId);

  PostDetailedEntity empty();
  // Метод для получения подробной информации о посте
  PostDetailedEntity? getDetailedPost(int postId);

  // Метод для сохранения подробной информации о посте
  void setDetailedPost(int postId, PostDetailedEntity postDetails);

  // Метод для очистки кеша
  void clear();
}
