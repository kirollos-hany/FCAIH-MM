import 'package:audioplayers/audio_cache.dart';
import 'package:fcaih_mm/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants/strings.dart';
import '../controllers/learning_alphabet_controller.dart';
import 'home.dart';

class LearnAlphabetsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LearnAlphabetsViewState();
}

class _LearnAlphabetsViewState extends State<LearnAlphabetsView> {
  final LearningAlphabetController _gameController =
      LearningAlphabetController();
  final String _gameHint = "اضغط علي الحرف";
  final AudioCache _audioPlayer = AudioCache();
  String _currentAlphabet;
  @override
  void initState() {
    super.initState();
    _currentAlphabet = _gameController.getFirstAlphabet();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(MATCHING_BG_IMG), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: MATCHING_TITLE_TOP_MARG),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: BACK_ARROW_LEFT_MARG_MATCHING),
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
                  )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _currentAlphabet = _gameController.getNextAlphabet();
                        });
                      },
                      icon: Image(
                        image: AssetImage(LEFT_ARROW_ICON),
                        width: BACK_ARROW_ICON_SIZE,
                        height: BACK_ARROW_ICON_SIZE,
                      ),
                    ),
                    FlatButton(
                        onPressed: () => _audioPlayer
                            .play(_gameController.getCurrentSound()),
                        child: Text(
                          _currentAlphabet,
                          style: TextStyle(
                              fontFamily: FONT_FAMILY,
                              fontSize: GAME_ANSWERS_TEXT_SIZE,
                              color: Colors.black),
                        )),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _currentAlphabet = _gameController.getPrevAlphabet();
                        });
                      },
                      icon: Image(
                        image: AssetImage(RIGHT_ARROW_ICON),
                        width: BACK_ARROW_ICON_SIZE * 2,
                        height: BACK_ARROW_ICON_SIZE * 2,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void _onBackBtnPressed() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
