import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../custom_widgets/game_image_list.dart';
import '../constants/strings.dart';
import '../constants/dimensions.dart';
import '../controllers/matching_game_controller.dart';

class MatchingGameView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MatchingGameViewState();
}

class _MatchingGameViewState extends State<MatchingGameView> {
  String _gameHint = "قم بتوصيل الصورة \n المناسبة للحرف";
  int _score = 0;
  String _scoreText = "مجموع نقاطك";
  final MatchingGameController _gameController = MatchingGameController();
  int _answerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(MATCHING_BG_IMG), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: MATCHING_TITLE_TOP_MARG),
                alignment: Alignment.center,
                child: Text(_gameHint,
                    style: TextStyle(
                        fontFamily: FONT_FAMILY,
                        fontSize: MATCHING_TITLE_SIZE,
                        color: Colors.black)),
              ),
              Container(
                margin: const EdgeInsets.only(top: MATCHING_SCORE_TOP_MARG),
                alignment: Alignment.center,
                child: Text(_scoreText + " : $_score",
                    style: TextStyle(
                        fontFamily: FONT_FAMILY,
                        fontSize: MATCHING_TITLE_SIZE,
                        color: Colors.black)),
              ),
              Center(
                child: Text(_gameController.answers[_answerIndex],
                    style: TextStyle(
                        fontFamily: FONT_FAMILY,
                        fontSize: GAME_ANSWERS_TEXT_SIZE,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              )
            ],
          )),
    );
  }
}
