import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/presentation/ui/common/custom_button_widget.dart';

void main() {
  int count = 0;
  GlobalKey<State<StatefulWidget>> previewContainer =
      GlobalKey<State<StatefulWidget>>();
  testWidgets('Test widget functionality', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: Scaffold(
            body: CustomButtonWidget(
              label: 'test',
              previewContainer: previewContainer,
              onTap: () => count++,
            ),
          ),
        ),
      ),
    );

    var button = find.byType(ElevatedButton);
    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(count, 1);
  });
  testWidgets('Test widget rendering', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: Scaffold(
            body: CustomButtonWidget(
              label: 'test',
              previewContainer: previewContainer,
              onTap: () {},
            ),
          ),
        ),
      ),
    );
    final BuildContext context = tester.element(find.byType(MaterialApp));

    Finder theme = find.byType(Theme);
    expect(theme, findsOneWidget, reason: 'No theme was found');

    expect(MediaQuery.of(context).size.height, isA<double>(),
        reason: 'Screen size is a not a valid number');
  });
}
