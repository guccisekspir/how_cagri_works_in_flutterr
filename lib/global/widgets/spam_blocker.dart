import 'package:flutter/material.dart';

class SpamBlocker extends StatefulWidget {
  SpamBlocker({
    Key? key,
    required this.child,
    required this.onTap,
    this.intervalMs = 500,
  }) : super(key: key);
  final Widget child;
  final GestureTapCallback? onTap;
  final int intervalMs;

  @override
  _SpamBlockerState createState() => _SpamBlockerState();
}

class _SpamBlockerState extends State<SpamBlocker> {
  int lastTimeClicked = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final now = DateTime.now().millisecondsSinceEpoch;
        if (now - lastTimeClicked < widget.intervalMs) {
          return;
        }
        lastTimeClicked = now;
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: widget.child,
    );
  }
}
