import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LadingPage extends StatefulWidget {
  const LadingPage({super.key, required this.child});

  final Widget child;

  @override
  State<LadingPage> createState() => _LadingPageState();
}

class _LadingPageState extends State<LadingPage> with TickerProviderStateMixin {
  /*<<----------->> variables <<----------->>*/
  late final _enterAnimation;
  late final _enterAnimationController;

  /*<<----------->> set animation controller method <<----------->>*/
  Future<void> _setAnimationController() async {
    _enterAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _enterAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _enterAnimationController, curve: Curves.easeInOut));

    await _enterAnimationController.forward();
  }

  /*<<----------->> change screen method <<----------->>*/
  Future<void> _changeScreen() async {
    await _enterAnimationController.reverse().then((_) {
      _enterAnimationController.dispose();
    });
  }

  @override
  void initState() {
    _setAnimationController();
    super.initState();
  }

  @override
  void dispose() {
    _changeScreen();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _enterAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, 100.h * (1.0 * _enterAnimation.value)),
          child: Opacity(
            opacity: _enterAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
