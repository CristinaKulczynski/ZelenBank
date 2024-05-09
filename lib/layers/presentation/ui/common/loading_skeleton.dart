import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({
    Key? key,
    required this.height,
    required this.width,
    required this.radius,
  }) : super(key: key);

  final double height, width, radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 800),
        baseColor: kDarkGrey,
        highlightColor: kLightGrey,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: kLightGrey.withOpacity(0.25),
          ),
        ),
      ),
    );
  }
}
