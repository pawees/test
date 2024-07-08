import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/feature/domain/entities/post_detailed_entity.dart';
import 'package:test_task/feature/presentation/bloc/post_detailed_bloc/post_detailed_cubit.dart';
import 'package:test_task/feature/presentation/bloc/statuses.dart';
import 'package:test_task/feature/presentation/ui/news_page/widgets/comments_list.dart';
import 'package:test_task/feature/presentation/ui/news_page/widgets/post_error.dart';
import 'package:test_task/feature/presentation/ui/skeletons/skeleton_post_detailed.dart';

class DetailedPost extends StatelessWidget {
  const DetailedPost({super.key,required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
        context.read<PostDetailedCubit>().fetchPostDetails(index+1);

    return MaterialApp(
      home: Scaffold(
        body: BlocBuilder<PostDetailedCubit, PostDetailedState>(
          builder: (context, state) {
            switch (state.status) {
              case PostsStatus.initial:
                return const SkeletonPostDetailed();
              case PostsStatus.loading:
                return const SkeletonPostDetailed();
              case PostsStatus.success:
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, right: 30, left: 16),
                  child: Column(
                    children: [
                      Image.network(state.details.imageUrl),
                      Text(
                        state.details.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      //Need_TEXT_WRAPPER
                      Text(
                        state.details.body,
                        style: TextStyle(fontSize: 15),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      CommentsList(comments: state.details.comments)
                    ],
                  ),
                );
              case PostsStatus.failure:
                return const PostError();
            }
          },
        ),
      ),
    );
  }
}
