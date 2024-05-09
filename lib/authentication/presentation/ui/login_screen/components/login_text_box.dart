import 'package:flutter/material.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';

class LoginTextBox extends StatelessWidget {
  String firstText;
  String secondText;
  LoginTextBox(
    this.firstText,
    this.secondText, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$firstText \n',
        style: const TextStyle(
          color: kPlainBlack,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        children: [
          TextSpan(
            text: '$secondText',
            style: const TextStyle(
              color: kAquaGreen,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
