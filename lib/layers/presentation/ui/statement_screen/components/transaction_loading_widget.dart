import 'package:flutter/material.dart';
import 'package:zelenbank/layers/presentation/ui/common/loading_skeleton.dart';

class TransactionLoadingWidget extends StatelessWidget {
  const TransactionLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
      child: Row(
        children: [
          const LoadingSkeleton(
            height: 16,
            width: 16,
            radius: 30,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LoadingSkeleton(
                        height: 16,
                        width: 200,
                        radius: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const LoadingSkeleton(
                        height: 14,
                        width: 150,
                        radius: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          LoadingSkeleton(
                            height: 16,
                            width: 30,
                            radius: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          LoadingSkeleton(
                            height: 16,
                            width: 100,
                            radius: 30,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const LoadingSkeleton(
                  height: 16,
                  width: 40,
                  radius: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
