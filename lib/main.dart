import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/api/json_placeholder_client.dart';
import 'package:test_task/feature/datasource/cache/posts_details_cache.dart';
import 'package:test_task/feature/datasource/repositories/posts_repository.dart';
import 'package:test_task/feature/presentation/bloc/post_detailed_bloc/post_detailed_cubit.dart';
import 'package:test_task/feature/presentation/bloc/posts_bloc/posts_cubit.dart';
import 'package:test_task/feature/presentation/ui/news_page/all_posts_view.dart';

void main() {
  final repository = PostsRepository(remoteDataSource: JsonPlaceholderApiClient(),cache: PostDetailsCache() );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<PostsCubit>(
        create: (ctx) => PostsCubit(repository),
      ),
      BlocProvider<PostDetailedCubit>(
        create: (ctx) => PostDetailedCubit(repository),
      ),
    ],
    child:AllPostsView(),
  ));
}
