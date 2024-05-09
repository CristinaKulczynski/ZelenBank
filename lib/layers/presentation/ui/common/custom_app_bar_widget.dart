import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    this.leading,
    this.title,
    this.trailing,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  final String? title;
  final Widget? leading;
  final Widget? trailing;

  @override
  final Size preferredSize;

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      leading: widget.leading,
      title: Text(
        widget.title ?? '',
      ),
      centerTitle: true,
      actions: [
        widget.trailing != null ? widget.trailing! : Container(),
      ],
      elevation: 0.0,
    );
  }
}
