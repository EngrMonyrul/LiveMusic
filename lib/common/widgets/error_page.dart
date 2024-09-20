import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.errorWidget});

  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("404!"),
      ),
      body: Center(
        child: errorWidget ?? const Text("Page Not Found"),
      ),
    );
  }
}
