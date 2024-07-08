import 'package:flutter/material.dart';
import 'package:test_task/feature/presentation/ui/skeletons/skeleton_widget.dart';

class SkeletonPostDetailed extends StatelessWidget {
  const SkeletonPostDetailed({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 12, bottom: 12, right: 30, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonWidget(
            width:  double.infinity,
            height: 380,
          ),
          SizedBox(
            height: 4,
          ),
          SkeletonWidget(width:  380, height: 18),
          SizedBox(
            height: 4,
          ),
          SkeletonWidget(width: 280, height: 18),
          SizedBox(
            height: 4,
          ),
          SkeletonCommentsList()
        ],
      ),
    );
  }
}

class SkeletonCommentsList extends StatelessWidget {
  const SkeletonCommentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonWidget(width: double.infinity, height: 22),
                  SizedBox(height: 4.0),
                  SkeletonWidget(width: double.infinity, height: 26),
                  SizedBox(height: 8.0),
                  SkeletonWidget(width: double.infinity, height: 43),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
