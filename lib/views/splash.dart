import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import '../constants/strings.dart';
import '../constants/dimensions.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Duration _animationSpeed = Duration(milliseconds: 150);

  void _onAnimationFinish() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
            image: AssetImage(SPLASH_BG_IMG),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: TyperAnimatedTextKit(
              text: [SPLASH_WELCOME_TITLE],
              textAlign: TextAlign.end,
              textStyle: TextStyle(fontFamily: FONT_FAMILY, fontSize: SPLASH_TITLE_SIZE),
              speed: _animationSpeed,
              displayFullTextOnTap: true,
              isRepeatingAnimation: true,
              repeatForever: false,
              totalRepeatCount: 1,
              onFinished: _onAnimationFinish,
            ),
          ),
        )
      ],
    );
  }
}
