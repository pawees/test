import 'package:flutter/material.dart';
import 'package:test_task/feature/presentation/ui/news_page/widgets/post.dart';
import '../../../../domain/entities/posts_entity.dart';

class PostsList extends StatelessWidget {
  final PostsEntity posts;
  const PostsList({Key? key,required this.posts,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: List.generate(
          10,
              (index) {
            return PostWidget(
              data: posts.response.posts[index],
            );
          },
        ),

    ));
  }
}
