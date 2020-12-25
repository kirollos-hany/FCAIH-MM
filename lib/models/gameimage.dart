class GameImage {
  String _imgPath;
  String _imgDesc;
  String _answer;

  GameImage(this._imgPath, this._imgDesc, this._answer);

  set imgPath(String imgPath) => this._imgPath = imgPath;

  String get imgPath => this._imgPath;

  set imgDesc(String imgDesc) => this._imgDesc = imgDesc;

  String get imgDesc => this._imgDesc;

  set answer(String answer) => this._answer = answer;

  String get answer => this._answer;
}
