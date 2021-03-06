import 'package:audioplayers/audio_cache.dart';
import 'package:fcaih_mm/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../custom_widgets/game_image_list.dart';
import '../constants/strings.dart';
import '../constants/dimensions.dart';
import '../controllers/matching_game_controller.dart';
import '../interfaces/on_correct_answer.dart';
import 'home.dart';

class MatchingGameView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MatchingGameViewState();
}

class _MatchingGameViewState extends State<MatchingGameView>
    implements OnCorrectAnswer {
  final String _gameHint = "قم بتوصيل الصورة \n المناسبة للحرف";
  int _score = 0;
  final String _scoreText = "مجموع نقاطك";
  final MatchingGameController _gameController = MatchingGameController();
  String _letterToShow;
  GameImagesList _gameImagesList;
  final AudioCache _assetsAudioPlayer = AudioCache();
  _MatchingGameViewState() {
    _gameImagesList = GameImagesList(this);
  }

  @override
  void initState() {
    super.initState();
    _letterToShow = _gameController.letterToShow;
  }

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
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: BACK_ARROW_LEFT_MARG_MATCHING),
                      child: IconButton(
                          onPressed: _onBackBtnPressed,
                          icon: Image(
                            image: AssetImage(BACK_ARROW_ICON),
                            width: BACK_ARROW_ICON_SIZE,
                            height: BACK_ARROW_ICON_SIZE,
                          )),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(_gameHint,
                              style: TextStyle(
                                  fontFamily: FONT_FAMILY,
                                  fontSize: MATCHING_TITLE_SIZE,
                                  color: Colors.black))
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: MATCHING_SCORE_TOP_MARG, left: MATCHING_SCORE_LEFT_MARG),
                alignment: Alignment.center,
                child: Text(_scoreText + " : $_score",
                    style: TextStyle(
                        fontFamily: FONT_FAMILY,
                        fontSize: MATCHING_TITLE_SIZE,
                        color: Colors.black)),
              ),
              Expanded(
                  child: Center(
                child: Row(children: [
                  Container(
                      child: DragTarget<int>(
                        builder: (context, candidates, rejected) {
                          return Text(_letterToShow,
                              style: TextStyle(
                                  fontFamily: FONT_FAMILY,
                                  fontSize: GAME_ANSWERS_TEXT_SIZE,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black));
                        },
                        onWillAccept: (data) => true,
                      ),
                      margin: const EdgeInsets.only(left: ANSWER_LEFT_MARG)),
                  Expanded(
                    child: Row(children: [
                      Container(
                          child: _gameImagesList,
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 2)
                    ], mainAxisAlignment: MainAxisAlignment.end),
                  )
                ], mainAxisAlignment: MainAxisAlignment.start),
              )),
            ],
          )),
    );
  }

  @override
  void onCorrectAnswer(int index) {
    setState(() {
      _score++;
      _letterToShow = _gameController.letterToShow;
    });
    if (_score == _gameController.numOfPlays) {
      _playApplauseSound();
      _showCongratsDialog();
    }
  }

  void _onBackBtnPressed() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void _showCongratsDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                CONGRATS_TEXT,
                style: TextStyle(
                    fontFamily: FONT_FAMILY,
                    fontSize: GAME_OVER_DIALOG_TEXT_SIZE),
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(FINISH_GAME_TEXT))
              ],
            ));
  }

  void _playApplauseSound() => _assetsAudioPlayer.play(APPLAUSE_SOUND);
}
