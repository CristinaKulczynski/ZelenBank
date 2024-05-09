import 'package:flutter/material.dart';
import 'package:zelenbank/authentication/presentation/ui/local_auth_screen/view/local_auth_screen.dart';
import 'package:zelenbank/authentication/presentation/ui/login_screen/view/login_screen.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';
import 'package:zelenbank/core/utils/constants/route_constants.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/view/statement_screen.dart';
import 'package:zelenbank/layers/presentation/ui/transaction_details/view/transaction_details_screen.dart';

import '../../layers/presentation/ui/map_screen/view/map_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case kLocalAuthScreen:
        return MaterialPageRoute(builder: (_) => const LocalAuthScreen());
      case kLoginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case kBankLocation:
        return MaterialPageRoute(builder: (_) => const MapScreen());
      case kStatementScreen:
        return AnimatedRoute(const StatementScreen());
      // return PageRouteBuilder(
      //   pageBuilder: (_, __, ___) => StatementScreen(),
      //   transitionsBuilder: (_, a, __, c) =>
      //       FadeTransition(opacity: a, child: c),
      // );
      // return MaterialPageRoute(builder: (_) => const StatementScreen());
      case kTransactionDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => TransactionDetails(args.toString()));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: kAquaGreen,
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class AnimatedRoute extends PageRouteBuilder {
  final Widget widget;

  AnimatedRoute(this.widget)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
