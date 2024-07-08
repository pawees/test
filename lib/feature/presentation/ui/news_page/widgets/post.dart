import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/feature/domain/entities/post_detailed_entity.dart';
import 'package:test_task/feature/presentation/bloc/post_detailed_bloc/post_detailed_cubit.dart';
import 'package:test_task/feature/presentation/ui/news_page/detailed_post.dart';

class PostWidget extends StatelessWidget {
  const PostWidget(this.index, this.post, {Key? key}) : super(key: key);
  final int index;
  final PostDetailedEntity post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailedPost(index: index,) 
                  ),
                );
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 12, bottom: 12, right: 30, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Image.network(post.imageUrl)),
            Text(
              post.title,
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
            Text(
              post.body,
              style: TextStyle(fontSize: 15),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
