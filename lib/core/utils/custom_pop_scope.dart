import 'package:flutter/material.dart';

class CustomPopScope<T> extends StatelessWidget {
  final Widget child;
  final bool canPop;
  final void Function(bool didPop, T? result)? onPopInvokedWithResult;

  const CustomPopScope({
    super.key,
    required this.child,
    this.canPop = false,
    this.onPopInvokedWithResult,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: onPopInvokedWithResult,
      child: child,
    );
  }
}
