import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../controllers/matching_game_controller.dart';
import '../constants/dimensions.dart';

class GameImagesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _GameImageListState(MatchingGameController());
}

class _GameImageListState extends State<GameImagesList> {
  _GameImageListState(this._gameController);

  final MatchingGameController _gameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: GAME_IMG_SIZE, maxWidth: GAME_IMG_SIZE),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _gameController.gameImages.length,
        itemBuilder: _listBuilder,
        shrinkWrap: true,
        padding: const EdgeInsets.all(GAME_IMG_LIST_PADDING),
      ),
    );
  }

  ListTile _listBuilder(BuildContext context, int index) {
    return ListTile(
        title: Container(child:Draggable<int>(
      data: index,
      affinity: Axis.vertical,
      feedback: Image(
          image: AssetImage(_gameController.gameImages[index].imgPath),
          width: GAME_IMG_SIZE,
          height: GAME_IMG_SIZE),
      child: Image(
          image: AssetImage(_gameController.gameImages[index].imgPath),
          width: GAME_IMG_SIZE,
          height: GAME_IMG_SIZE),
      childWhenDragging: Image(
          image: AssetImage(_gameController.gameImages[index].imgPath),
          width: GAME_IMG_SIZE,
          height: GAME_IMG_SIZE),
    ), width: GAME_IMG_SIZE, height: GAME_IMG_SIZE));
  }
}
