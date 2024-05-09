import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(5),
        border: const Border.fromBorderSide(
          BorderSide(
            color: kTimelineColor,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              'assets/google-icon.svg',
              height: 26,
            ),
          ),
          const Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Entrar com Google',
                style: TextStyle(
                  color: kPlainBlack,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
