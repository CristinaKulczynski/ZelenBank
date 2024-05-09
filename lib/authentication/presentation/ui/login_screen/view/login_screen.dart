import 'package:flutter/material.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zelenbank/authentication/presentation/controllers/auth_controller.dart';
import 'package:zelenbank/core/injector/injector.dart';
import 'package:zelenbank/core/utils/constants/route_constants.dart';
import 'package:zelenbank/layers/presentation/ui/common/custom_alert_dialog.dart';
import 'package:zelenbank/authentication/presentation/ui/login_screen/components/login_well_render.dart';

import '../components/login_text_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = serviceLocator.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPlainWhite,
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              child: Container(
                color: kDarkGreen,
                padding: const EdgeInsets.only(top: 30),
                height: size.height * 0.7,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 50,
                      color: kPlainWhite,
                    ),
                    SvgPicture.asset(
                      'assets/login_image.svg',
                      width: size.width,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoginTextBox('Uma nova maneira de', 'gerenciar dinheiro'),
                    InkWell(
                      onTap: () async {
                        await _authController.signInWithGoogle();
                        print(_authController.loginState);
                        if (_authController.loginState == LoginState.success) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            kLocalAuthScreen,
                            (route) => false,
                          );
                        } else if (_authController.loginState ==
                            LoginState.error) {
                          print('adfdagadadg');
                          showAlertDialog(context);
                        }
                      },
                      child: const LoginButton(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
