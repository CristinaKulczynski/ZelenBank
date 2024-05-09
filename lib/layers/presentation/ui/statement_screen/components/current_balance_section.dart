import 'package:flutter/material.dart';
import 'package:zelenbank/core/injector/injector.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';

class CurrentBalanceSection extends StatefulWidget {
  const CurrentBalanceSection({super.key});

  @override
  State<CurrentBalanceSection> createState() => _CurrentBalanceSectionState();
}

class _CurrentBalanceSectionState extends State<CurrentBalanceSection> {
  final TransactionController _transactionController =
      serviceLocator.get<TransactionController>();

  @override
  void initState() {
    _transactionController.getBalanceVisibility();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _transactionController.getCurrentBalance();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: 91,
      color: theme.backgroundColor,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width * 0.35,
              child: Row(
                children: [
                  Text(
                    'Seu saldo',
                    style: TextStyle(
                      fontSize: 17,
                      color: theme.textTheme.headline1?.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _transactionController.changeBalanceVisibility();
                    },
                    icon: AnimatedBuilder(
                      animation: _transactionController,
                      builder: (context, child) {
                        return Icon(
                          _transactionController.isBalanceVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: theme.primaryColor,
                          size: 21,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
              animation: _transactionController,
              builder: (context, child) {
                return _transactionController.isBalanceVisible
                    ? SizedBox(
                        height: 40,
                        child: RichText(
                          text: TextSpan(
                            text: 'R\$ ',
                            style: theme.textTheme.caption,
                            children: [
                              TextSpan(
                                text: transactionFormattedValue(),
                                style: theme.textTheme.headline4,
                              )
                            ],
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 40,
                        width: screenSize.width * 0.31,
                        child: Center(
                          child: Container(
                            height: 4.5,
                            color: theme.primaryColor,
                          ),
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }

  String transactionFormattedValue() {
    return _transactionController.balance
        .toStringAsFixed(2)
        .replaceAll('.', ',');
  }
}
