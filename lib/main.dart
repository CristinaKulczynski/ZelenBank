import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:zelenbank/authentication/presentation/controllers/auth_controller.dart';
import 'package:zelenbank/core/utils/route_generator.dart';
import 'core/firebase/notification/firebase_notification_service.dart';
import 'core/injector/injector.dart';
import 'core/theme/theme.dart';
import 'core/utils/constants/route_constants.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupLocator();

  runApp(
    const ZelenBankApp(),
  );
}

class ZelenBankApp extends StatefulWidget {
  const ZelenBankApp({super.key});

  @override
  State<ZelenBankApp> createState() => _ZelenBankAppState();
}

class _ZelenBankAppState extends State<ZelenBankApp> {
  final AuthController _authController = serviceLocator.get<AuthController>();
  final FirebaseMessagingService _messagingService =
      serviceLocator.get<FirebaseMessagingService>();
  @override
  void initState() {
    _authController.getUserThemeMode();
    _authController.isUserLoggedIn();
    if (_authController.isLogged) {
      _authController.getCurrentUser();
    }
    _messagingService.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _authController,
      builder: (context, child) {
        return MaterialApp(
          title: 'Zelen Bank',
          debugShowCheckedModeBanner: false,
          themeMode: _authController.isUserThemeDark
              ? ThemeMode.dark
              : ThemeMode.light,
          theme: CustomTheme.customTheme[Themes.lightTheme],
          darkTheme: CustomTheme.customTheme[Themes.darkTheme],
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute:
              _authController.isLogged ? kLocalAuthScreen : kLoginScreen,
        );
      },
    );
  }
}
