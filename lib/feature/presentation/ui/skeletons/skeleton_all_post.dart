import 'package:flutter/material.dart';
import 'package:test_task/feature/presentation/ui/skeletons/skeleton_widget.dart';

class SkeletonAllPost extends StatelessWidget {
  const SkeletonAllPost({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: _SkeletonPostsList(),
      ),
    );
  }
}

class _SkeletonPostsList extends StatelessWidget {
  const _SkeletonPostsList({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();

    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => const Padding(
              padding: EdgeInsets.all(8),
              child: _SkeletonPostWidget(),
            ),
            childCount: 10,
          ),
        ),
      ],
    );
  }
}

class _SkeletonPostWidget extends StatelessWidget {
  const _SkeletonPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 12, bottom: 12, right: 30, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonWidget(
            width: double.infinity,
            height: 380,
          ),
          SizedBox(
            height: 4,
          ),
          SkeletonWidget(width: double.infinity, height: 18),
          SizedBox(
            height: 4,
          ),
          SkeletonWidget(width: double.infinity, height: 18),
        ],
      ),
    );
  }
}
