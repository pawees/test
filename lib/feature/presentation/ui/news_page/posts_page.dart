import 'package:flutter/material.dart';
import 'package:test_task/feature/domain/entities/post_detailed_entity.dart';
import 'package:test_task/feature/presentation/ui/news_page/widgets/post.dart';

class PostPage extends StatelessWidget {
  final List<PostDetailedEntity> posts;

  PostPage(this.posts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: _PostsList(
          posts,
        ),
      ),
    );
  }
}

class _PostsList extends StatelessWidget {
  _PostsList(this.news, {Key? key}) : super(key: key);



  final List<PostDetailedEntity> news;

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();

    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: EdgeInsets.all(8),
              child: PostWidget(index,news[index]),
            ),
            childCount: news.length,
          ),
        ),
      ],
    );
  }
}