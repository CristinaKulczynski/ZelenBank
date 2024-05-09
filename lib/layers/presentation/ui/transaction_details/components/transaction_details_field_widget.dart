import 'package:flutter/material.dart';

class TransactionDetailsFieldWidget extends StatelessWidget {
  const TransactionDetailsFieldWidget({
    super.key,
    required this.fieldTitle,
    required this.fieldDescription,
  });

  final String fieldTitle;
  final String fieldDescription;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldTitle,
            style: theme.textTheme.caption,
          ),
          const SizedBox(height: 12),
          Text(
            fieldDescription,
            style: theme.textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
