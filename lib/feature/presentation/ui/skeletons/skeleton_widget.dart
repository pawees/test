import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonWidget extends StatelessWidget {
  final double width;
  final double height;
  final double? radius;

  const SkeletonWidget({
    super.key,
    required this.width,
    required this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      clipBehavior: Clip.hardEdge,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.transparent,
       // borderRadius: BorderRadius.circular(radius ?? 24),
      ),
      child: Shimmer(
        enabled: true,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff906AF4), Color(0xff7295F6)],
        ),
        child: SkeletonContainer(
          width: width,
          height: height,
          radius: radius,
        ),
      ),
    );
  }
}

class SkeletonContainer extends StatelessWidget {
  final double width;
  final double height;
  final double? radius;

  const SkeletonContainer({
    super.key,
    required this.width,
    required this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.green,
        // borderRadius: BorderRadius.circular(radius ?? 24),
      ),
    );
  }
}
