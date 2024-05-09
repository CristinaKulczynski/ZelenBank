import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors_constants.dart';

class TimelineDividerWidget extends StatelessWidget {
  const TimelineDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width,
      height: 16,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              children: [
                Container(
                  color: kTimelineColor,
                  height: 8,
                  width: 1,
                ),
                Center(
                  child: SizedBox(
                    height: 0,
                    width: 14,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: kTimelineColor,
                  height: 8,
                  width: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
