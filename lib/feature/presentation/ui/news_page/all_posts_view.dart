import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/feature/datasource/repositories/posts_repository.dart';
import 'package:test_task/feature/presentation/ui/news_page/posts_page.dart';
import 'package:test_task/feature/presentation/ui/news_page/widgets/post_error.dart';

import '../../bloc/posts_bloc/posts_cubit.dart';
import '../../bloc/statuses.dart';


class AllPostsView extends StatefulWidget {
  const AllPostsView({
    Key? key,
  }) : super(key: key);

  @override
  State<AllPostsView> createState() => AllPostsViewState();
}

//TODO skeletons
//TODO cached+
//TODO entry point

class AllPostsViewState extends State<AllPostsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(context.read<PostsRepository>()),
      child: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          switch (state.status) {
            case PostsStatus.initial:
              //return const SkeletonShimmer();
            case PostsStatus.loading:
              //return const SkeletonShimmer();
            case PostsStatus.success:
              return PostsPage(
                posts: state.posts,
                // onRefresh: () {
                //   return context.read<PostsCubit>().refreshWeather();
                // },
              );
            case PostsStatus.failure:
              return const PostError();
          }
        },
      ),
    );
  }
}
