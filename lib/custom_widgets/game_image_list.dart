import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../controllers/matching_game_controller.dart';
import '../constants/dimensions.dart';
import '../models/gameimage.dart';
import '../interfaces/on_correct_answer.dart';
import '../constants/strings.dart';

class GameImagesList extends StatefulWidget {
  final OnCorrectAnswer _onCorrectAnswer;
  GameImagesList(this._onCorrectAnswer);
  @override
  State<StatefulWidget> createState() =>
      _GameImageListState(MatchingGameController(), _onCorrectAnswer);
}

class _GameImageListState extends State<GameImagesList> {
  _GameImageListState(this._gameController, this._onCorrectAnswerCallback);

  final MatchingGameController _gameController;

  List<GameImage> _currentGameImages;

  OnCorrectAnswer _onCorrectAnswerCallback;

  final AudioCache _assetsAudioPlayer = AudioCache();

  @override
  void initState() {
    super.initState();
    _currentGameImages = _gameController.currentGameImages;
  }

  void _playCorrectAnsSound() =>
      _assetsAudioPlayer.play(CORRECT_ANS_SOUND);

  void _playWrongAnsSound() => _assetsAudioPlayer.play(WRONG_ANS_SOUND);

  void _showCorrectAnswerSnackBar(int index) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(_gameController.getImgDesc(index),
          style: TextStyle(
              fontFamily: FONT_FAMILY, fontSize: 25, color: Colors.green)),
      duration: Duration(seconds: 5),
    ));
  }

  void _showWrongAnswerSnackBar(int index) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(_gameController.getImgDesc(index),
          style: TextStyle(
              fontFamily: FONT_FAMILY, fontSize: 25, color: Colors.red)),
      duration: Duration(seconds: 2),
    ));
  }

  void _onCorrectAnswer(int index) {
    _playCorrectAnsSound();
    _showCorrectAnswerSnackBar(index);
    _gameController.removeGameImage(index);
    _gameController.updateCurrentGameState();
    setState(() {
      _currentGameImages = [];
      _currentGameImages = _gameController.currentGameImages.toList();
    });
    _gameController.updateLetterToShow();
    _onCorrectAnswerCallback.onCorrectAnswer(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _currentGameImages.length,
      itemBuilder: _listBuilder,
      shrinkWrap: true,
      padding: const EdgeInsets.all(GAME_IMG_LIST_PADDING),
    ));
  }

  ListTile _listBuilder(BuildContext context, int index) {
    return ListTile(
      title: Draggable<int>(
        onDragCompleted: () {
          if (_gameController.isChoiceCorrect(
              index, _gameController.letterToShow)) {
            _onCorrectAnswer(index);
          } else {
            _playWrongAnsSound();
            _showWrongAnswerSnackBar(index);
          }
        },
        data: index,
        affinity: Axis.horizontal,
        feedback: Image(
            image: AssetImage(_currentGameImages[index].imgPath),
            width: GAME_IMG_SIZE,
            height: GAME_IMG_SIZE),
        child: Image(
            image: AssetImage(_currentGameImages[index].imgPath),
            width: GAME_IMG_SIZE,
            height: GAME_IMG_SIZE),
        childWhenDragging: Image(
            image: AssetImage(_currentGameImages[index].imgPath),
            width: GAME_IMG_SIZE,
            height: GAME_IMG_SIZE),
      ),
    );
  }
}
