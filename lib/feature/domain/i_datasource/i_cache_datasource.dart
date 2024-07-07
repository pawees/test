abstract class IPostDetailsCache {
  // Метод для получения подробной информации о посте
  Map<String, dynamic>? getDetailedPost(int postId);

  // Метод для сохранения подробной информации о посте
  void setDetailedPost(int postId, Map<String, dynamic> postDetails);

  // Метод для очистки кеша
  void clear();
}
