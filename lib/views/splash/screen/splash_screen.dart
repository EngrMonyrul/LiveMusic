import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_score/main.dart';
import 'package:live_score/utils/constants/assets_const.dart';
import 'package:live_score/utils/constants/components_const.dart';
import 'package:live_score/utils/extensions/context_ext.dart';
import 'package:live_score/utils/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  /*<<----------->> variables <<----------->>*/
  final _pageViewController = PageController(initialPage: 0);
  int _pageIndex = 0;
  late final _entryAnimation;
  late final _entryAnimationController;

  /*<<----------->> next button pressed methods <<----------->>*/
  void _pressedOnNext() {
    setState(() {
      if ((_pageViewController.page?.round() ?? 0) <
          ComponentsConst.splashSloganList.length - 1) {
        final pageIndex = (_pageViewController.page?.round() ?? 0);
        _pageViewController.animateToPage(
          pageIndex + 1,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
        _pageIndex = pageIndex + 1;
      }
    });
  }

  /*<<----------->> animation controller method <<----------->>*/
  Future<void> _animationControllerSetup() async {
    _entryAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _entryAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _entryAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    await _entryAnimationController.forward();
  }

  /*<<----------->> change screen method <<----------->>*/
  Future<void> _changeScreen() async {
    await _entryAnimationController.reverse().then((_) {
      Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
    });
  }

  @override
  void initState() {
    _animationControllerSetup();
    super.initState();
  }

  @override
  void dispose() {
    _entryAnimationController.dispose();
    super.dispose();
  }

  /*<<----------->> builder method <<----------->>*/
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final screenSize = context.screenSize;

    return AnimatedBuilder(
      animation: _entryAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, 100.h * (1.0 - _entryAnimation.value)),
          child: Opacity(
            opacity: _entryAnimation.value,
            child: Container(
              decoration: const BoxDecoration(
                /*<<----------->> background image <<----------->>*/
                image: DecorationImage(
                  image: AssetImage(AssetsConsts.listeningMusic),
                  fit: BoxFit.cover,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenSize.height * .4,
                        ),
                        Expanded(
                          child: PageView.builder(
                            controller: _pageViewController,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: ComponentsConst.splashSloganList.length,
                            itemBuilder: (context, index) {
                              final item =
                                  ComponentsConst.splashSloganList[index];

                              /*<<----------->> page items <<----------->>*/
                              return Column(
                                children: [
                                  /*<<----------->> slogan title <<----------->>*/
                                  Text(
                                    item.title ?? "",
                                    style: TextStyle(
                                      color: theme.colorScheme.onPrimary,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  /*<<----------->> slogan description <<----------->>*/
                                  Text(
                                    item.description ?? "",
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: theme.colorScheme.onPrimary,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        /*<<----------->> next or get started button <<----------->>*/
                        SizedBox(
                          width: screenSize.width,
                          child: ElevatedButton(
                            onPressed: _pageIndex ==
                                    (ComponentsConst.splashSloganList.length -
                                        1)
                                ? _changeScreen
                                : _pressedOnNext,
                            child: Text(
                              _pageIndex ==
                                      (ComponentsConst.splashSloganList.length -
                                          1)
                                  ? "Get Started"
                                  : "Next",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        /*<<----------->> indicator <<----------->>*/
                        Center(
                          child: SizedBox(
                            height: 10,
                            width: 80,
                            child: Center(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    ComponentsConst.splashSloganList.length,
                                itemBuilder: (context, index) {
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 600),
                                    alignment: Alignment.center,
                                    height: 10,
                                    width: _pageIndex == index ? 30 : 10,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.onPrimary,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
