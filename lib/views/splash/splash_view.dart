import 'package:ebook_app/core/utils/colors.dart';
import 'package:ebook_app/core/utils/text.dart';
import 'package:ebook_app/views/body/body.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _displayAnimation;
  late Animation _curve;
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(-1, 0),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));
  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    super.initState();
    _curve = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 500), weight: 500),
    ]).animate(_curve as Animation<double>);
    _displayAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 500), weight: 500),
    ]).animate(_curve as Animation<double>);

    _controller.forward();
    _controller.addListener(() {
      print(_sizeAnimation.value);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, _) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
                  height: _displayAnimation.value,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, _) {
                          return Lottie.asset(
                            "assets/splash.json",
                            height: _sizeAnimation.value,
                          );
                        },
                      ),
                    ],
                  ),
                );
              }),
          SlideTransition(
            position: _offsetAnimation,
            child: FadeTransition(
              opacity: _controller,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    AppText.heading2SB(
                      "Reading in any way Convienient",
                      centered: true,
                      color: kSecondaryColor,
                      multitext: true,
                    ),
                    const SizedBox(height: 8),
                    AppText.heading6M(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      centered: true,
                      color: kSecondaryColor,
                      multitext: true,
                    ),
                    const SizedBox(height: 18),
                    InkWell(
                      onTap: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Body())),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                            child: Icon(Icons.arrow_forward_outlined,
                                color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
