import 'package:test_task/feature/domain/entities/posts_entity.dart';
import 'package:test_task/feature/domain/i_datasource/i_cache.dart';

import '../../domain/entities/post_detailed_entity.dart';
import '../../domain/i_datasource/i_datasource.dart';
import '../../domain/i_repositories/I_posts_repository.dart';

class PostsRepository implements IPostsRepository {
  final IApiClient remoteDataSource;
  final ICache cache;

  PostsRepository({
    required this.remoteDataSource,
    required this.cache,
  });

  @override
  Future<PostDetailedEntity> getDetails(int post) async {
    final postDetails = await remoteDataSource.getDetails();
    return PostDetailedEntity(imageUrl: postDetails., title: title, body: body, comments: comments)


  }

  @override
  Future<PostsEntity> getPosts() async {
    final posts = await remoteDataSource.getPosts();
    return PostsEntity(response: posts);


  }


  // @override
  // Future<ApiResult<NewsModel>> fetchNews(
  //     int page,
  //     ) async {
  //   if (await networkInfo.isConnected || kIsWeb) {
  //     try {
  //       return await remoteDataSource.fetchNews(page);
  //     } on Exception catch (e, st) {
  //       return ApiResult.failure(error: HandleException.getException(e, st));
  //     }
  //   } else {
  //     if (page == 1) {
  //       try {
  //         return await localDataSource.fetchNewsFromCache();
  //       } on Exception catch (e, st) {
  //         return ApiResult.failure(error: HandleException.getException(e, st));
  //       }
  //     } else {
  //       return const ApiResult.failure(error: HandleException.noInternetConnection());
  //     }
  //   }
  // }
  //
  // @override
  // Future<ApiResult<NewsEntity>> fetchNewsByCategory(
  //     int page,
  //     String category,
  //     ) async {
  //   if (await networkInfo.isConnected || kIsWeb) {
  //     try {
  //       return await remoteDataSource.fetchNewsByCategory(page, category);
  //     } on Exception catch (e, st) {
  //       return ApiResult.failure(error: HandleException.getException(e, st));
  //     }
  //   } else {
  //     if (page == 1) {
  //       try {
  //         return await localDataSource.fetchNewsByCategoryFromCache(category);
  //       } on Exception catch (e, st) {
  //         return ApiResult.failure(error: HandleException.getException(e, st));
  //       }
  //     } else {
  //       return const ApiResult.failure(error: HandleException.noInternetConnection());
  //     }
  //   }
  // }
  //
  // @override
  // Future<ApiResult<NewsModel>> fetchNewsCategories() async {
  //   return localDataSource.fetchNewsFromCache();
  // }
  //
  // @override
  // Future<ApiResult<NewsEntity>> fetchQuestions(int page) async {
  //   if (await networkInfo.isConnected || kIsWeb) {
  //     try {
  //       return await remoteDataSource.fetchQuestions(page);
  //     } on Exception catch (e, st) {
  //       return ApiResult.failure(error: HandleException.getException(e, st));
  //     }
  //   } else {
  //     if (page == 1) {
  //       try {
  //         return await localDataSource.fetchQuestionsFromCache();
  //       } on Exception catch (e, st) {
  //         return ApiResult.failure(error: HandleException.getException(e, st));
  //       }
  //     } else {
  //       return const ApiResult.failure(error: HandleException.noInternetConnection());
  //     }
  //   }
  // }
  //
  // @override
  // Future<ApiResult<NewsModel>> fetchQuestionCategories() async {
  //   return localDataSource.fetchQuestionsFromCache();
  // }
  //
  // @override
  // Future<ApiResult<NewsEntity>> fetchQuestionsByCategory(
  //     int page,
  //     String category,
  //     ) async {
  //   if (await networkInfo.isConnected || kIsWeb) {
  //     try {
  //       return await remoteDataSource.fetchQuestionsByCategory(page, category);
  //     } on Exception catch (e, st) {
  //       return ApiResult.failure(error: HandleException.getException(e, st));
  //     }
  //   } else {
  //     if (page == 1) {
  //       try {
  //         return await localDataSource.fetchQuestionsByCategoryFromCache(category);
  //       } on Exception catch (e, st) {
  //         return ApiResult.failure(error: HandleException.getException(e, st));
  //       }
  //     } else {
  //       return const ApiResult.failure(error: HandleException.noInternetConnection());
  //     }
  //   }
  // }
  //
  // @override
  // Future<ApiResult<ArticleEntity>> getSingleNews(String id) async {
  //   if (await networkInfo.isConnected || kIsWeb) {
  //     final remoteSingleNews = await remoteDataSource.getSingleNews(id);
  //
  //     await localDataSource.singleNewsToCache(remoteSingleNews);
  //
  //     return remoteSingleNews;
  //   } else {
  //     return localDataSource.getSingleNewsFromCache(id);
  //   }
  // }
  //
  // @override
  // Future<ApiResult<ArticleEntity>> getSingleQuestion(String id) async {
  //   if (await networkInfo.isConnected || kIsWeb) {
  //     final remoteSingleQuestion = await remoteDataSource.getSingleQuestion(id);
  //
  //     await localDataSource.singleQuestionToCache(remoteSingleQuestion);
  //
  //     return remoteSingleQuestion;
  //   } else {
  //     return localDataSource.getSingleQuestionFromCache(id);
  //   }
  // }
  //
  // @override
  // Future<ApiResult<NewsEntity>> fetchNewsByCategoryFromCache(
  //     String category,
  //     ) async {
  //   return localDataSource.fetchNewsByCategoryFromCache(category);
  // }
  //
  // @override
  // Future<ApiResult<NewsEntity>> fetchQuestionsByCategoryFromCache(
  //     String category,
  //     ) async {
  //   return localDataSource.fetchQuestionsByCategoryFromCache(category);
  // }


}
