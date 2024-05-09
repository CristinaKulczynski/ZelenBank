import 'package:flutter/material.dart';
import 'package:zelenbank/layers/presentation/ui/common/loading_skeleton.dart';

class TransactionDetailsLoadingWidget extends StatelessWidget {
  const TransactionDetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          LoadingSkeleton(
            height: 16,
            width: 180,
            radius: 30,
          ),
          SizedBox(
            height: 12,
          ),
          LoadingSkeleton(
            height: 16,
            width: 150,
            radius: 30,
          ),
        ],
      ),
    );
  }
}
