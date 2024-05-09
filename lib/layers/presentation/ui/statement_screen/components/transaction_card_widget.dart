import 'package:flutter/material.dart';
import 'package:zelenbank/core/utils/constants/route_constants.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/custom_timeline_widget.dart';

import '../../../../../core/utils/constants/colors_constants.dart';

class TransactionCardWidget extends StatelessWidget {
  const TransactionCardWidget({
    super.key,
    required this.transactionEntity,
    required this.isFirstWidget,
  });

  final TransactionEntity transactionEntity;
  final bool isFirstWidget;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        kTransactionDetailsScreen,
        arguments: transactionEntity.id,
      ),
      child: Container(
        color: isTransactionTypePix()
            ? theme.backgroundColor
            : theme.scaffoldBackgroundColor,
        width: screenSize.width,
        height: isFirstWidget ? 76 : 90,
        child: Stack(
          children: [
            Row(
              children: [
                CustomTimelineWidget(
                  isFirstWidget: isFirstWidget,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transactionEntity.description,
                                style: theme.textTheme.headline1,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                transactionEntity.targetName,
                                style: theme.textTheme.subtitle1,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                isTransactionSent()
                                    ? '- ${transactionFormattedValue()}'
                                    : transactionFormattedValue(),
                                style: theme.textTheme.caption,
                              )
                            ],
                          ),
                        ),
                        Text(
                          '${transactionEntity.createdAt.day}/${transactionEntity.createdAt.month}',
                          style: theme.textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            isTransactionTypePix()
                ? Padding(
                    padding: const EdgeInsets.only(top: 10, right: 12),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 20,
                        width: 50,
                        color: theme.primaryColor,
                        child: const Center(
                          child: Text(
                            'Pix',
                            style: TextStyle(
                              color: kPlainWhite,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  String transactionFormattedValue() {
    return 'R\$ ${transactionEntity.amount.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  bool isTransactionSent() {
    return transactionEntity.transactionType.contains('OUT');
  }

  bool isTransactionTypePix() {
    return transactionEntity.transactionType.contains('PIX');
  }
}
