import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> previewContainer;
  final Function() onTap;
  final String label;
  const CustomButtonWidget({
    super.key,
    required this.previewContainer,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: theme.primaryColor,
        foregroundColor: theme.scaffoldBackgroundColor,
        fixedSize: Size(size.width, 50),
        shadowColor: Colors.transparent,
      ),
      child: Text(label, style: theme.textTheme.button),
    );
  }
}
