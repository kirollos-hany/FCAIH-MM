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
  String _initTitle = "قم بتوصيل الصورة \n المناسبة للحرف";
  int _score = 0;
  String _scoreText = "مجموع نقاطك";
  final MatchingGameController _gameController = MatchingGameController();
  int _answerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
            image: AssetImage(MATCHING_BG_IMG),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: MATCHING_TITLE_TOP_MARG),
                alignment: Alignment.center,
                child: Text(_initTitle,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: MATCHING_TITLE_SIZE,
                        fontFamily: FONT_FAMILY)),
              ),
              Container(
                margin: const EdgeInsets.only(top: MATCHING_SCORE_TOP_MARG),
                alignment: Alignment.center,
                child: Text(_scoreText + " : $_score",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: MATCHING_TITLE_SIZE,
                        fontFamily: FONT_FAMILY)),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    alignment: Alignment.center,
                    child: DragTarget<int>(
                        builder: (BuildContext context, List<dynamic> accepted,
                            List<dynamic> rejected) {
                          return Text(_gameController.answers[_answerIndex],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: GAME_ANSWERS_TEXT_SIZE,
                                  fontFamily: FONT_FAMILY,
                                  fontWeight: FontWeight.bold));
                        },
                        onWillAccept: (int data) => true,
                        onAccept: (int chosenImageIndex) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("works"),
                          ));
                        }),
                    margin:
                        const EdgeInsets.only(top: GAME_ANSWER_TEXT_TOP_MARG)),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  child: GameImagesList(),
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
