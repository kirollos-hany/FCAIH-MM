import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../custom_widgets/button.dart';
import '../constants/dimensions.dart';
import '../constants/strings.dart';
import 'matching.dart';
import 'learn_alphabets_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
            image: AssetImage(HOME_BG_IMG),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: OrangeButton(
                        MATCHING_GAME_TITLE, _onMatchingGameBtnPressed),
                    margin: EdgeInsets.only(
                        left: HOME_BTNS_SIDE_MARGIN,
                        bottom: HOME_UPPER_BTN_BOT_MARGIN,
                        right: HOME_BTNS_SIDE_MARGIN),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: OrangeButton(
                        LEARN_ALPHABETS_GAME_TITLE, _onLearnAlphaBtnPressed),
                    margin: EdgeInsets.only(
                        left: HOME_BTNS_SIDE_MARGIN,
                        bottom: HOME_LOWER_BTN_BOT_MARGIN,
                        right: HOME_BTNS_SIDE_MARGIN),
                  )
                ],
              ),
            ))
      ],
    );
  }

  void _onMatchingGameBtnPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MatchingGameView()));
  }

  void _onLearnAlphaBtnPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LearnAlphabetsView()));
  }
}
