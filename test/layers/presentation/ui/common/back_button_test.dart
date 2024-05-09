import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  testWidgets('Button is present and triggers navigation after tapped',
      (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: const Scaffold(body: CustomBackButton()),
        navigatorObservers: [mockObserver],
      ),
    );

    var button = find.byType(IconButton);

    expect(button, findsOneWidget);
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    verify(() => mockObserver.didPop(any(), any()));
    await tester.pumpAndSettle();
  });

  testWidgets('Widget renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        home: const Scaffold(body: CustomBackButton()),
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
    ));

    final BuildContext context = tester.element(find.byType(MaterialApp));
    bool testIsInLightTheme() {
      if (Theme.of(context).brightness == Brightness.light) {
        return true;
      }
      return false;
    }

    expect(
      testIsInLightTheme(),
      true,
      reason: "Theme was supposed to start on light mode",
    );

    expect(MediaQuery.of(context).size.height, isA<double>(),
        reason: 'Screen size is a not a valid number');
  });
}
