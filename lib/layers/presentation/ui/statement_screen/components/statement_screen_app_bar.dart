import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatementAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  const StatementAppBarWidget({
    super.key,
    this.title,
    this.trailing,
    this.leading,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  final Widget? leading;
  final String? title;
  final Widget? trailing;

  @override
  final Size preferredSize;

  @override
  State<StatementAppBarWidget> createState() => _StatementAppBarWidgetState();
}

class _StatementAppBarWidgetState extends State<StatementAppBarWidget> {
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
