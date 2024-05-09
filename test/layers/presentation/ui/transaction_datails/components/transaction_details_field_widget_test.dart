import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/presentation/ui/transaction_details/components/transaction_details_field_widget.dart';

void main() {
  TransactionDetailsFieldWidget transactionDetailsFieldWidget =
      const TransactionDetailsFieldWidget(
    fieldTitle: 'fieldTitle',
    fieldDescription: 'fieldDescription',
  );

  testWidgets(
    'Widget renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(),
          child: MaterialApp(
            home: const Scaffold(
                body: TransactionDetailsFieldWidget(
              fieldTitle: 'fieldTitle',
              fieldDescription: 'fieldDescription',
            )),
            theme: ThemeData(
              primaryColor: Colors.black,
              scaffoldBackgroundColor: Colors.blue,
              textTheme: const TextTheme(
                button: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );

      final BuildContext context = tester.element(find.byType(MaterialApp));

      expect(MediaQuery.of(context).size.height, isA<double>(),
          reason: 'Screen size is a not a valid number');

      Finder texts = find.byType(Text);
      expect(texts, findsNWidgets(2));
    },
  );
}
