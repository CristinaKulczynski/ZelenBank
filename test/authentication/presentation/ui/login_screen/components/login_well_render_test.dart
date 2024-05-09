import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zelenbank/authentication/presentation/ui/login_screen/components/login_well_render.dart';

void main() {
  const LoginButton();

  testWidgets(
    'Widget renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
            home: Scaffold(body: LoginButton()),
          ),
        ),
      );
      Finder outerContainer = find.byType(Container);
      final Size ocSize = tester.getSize(outerContainer);
      expect(ocSize.height, equals(56));

      Finder googleLogo = find.byType(SvgPicture);
      final Size glSize = tester.getSize(outerContainer);
      expect(glSize.height, equals(56));
    },
  );
}
