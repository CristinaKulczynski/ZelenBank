import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors_constants.dart';

class CustomTimelineWidget extends StatelessWidget {
  const CustomTimelineWidget({
    super.key,
    required this.isFirstWidget,
  });

  final bool isFirstWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Container(
            color: kTimelineColor,
            height: isFirstWidget ? 30 : 38,
            width: 1,
          ),
          Center(
            child: SizedBox(
              height: 14,
              width: 14,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 8,
                  width: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(1.8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: kAquaGreen,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: kTimelineColor,
            height: isFirstWidget ? 32 : 38,
            width: 1,
          ),
        ],
      ),
    );
  }
}
