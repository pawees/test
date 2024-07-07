import 'package:flutter/material.dart';
import 'package:test_task/feature/presentation/ui/news_page/widgets/posts_list.dart';

import '../../../domain/entities/posts_entity.dart';

class PostsPage extends StatelessWidget {
  final PostsEntity posts;
  const PostsPage({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillViewport(
            delegate: SliverChildListDelegate(
              [
                  PostsList(posts: posts),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
