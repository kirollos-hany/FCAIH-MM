class LearnAlphabets {
  LearnAlphabets(this._alphabet, this._soundPath);
  String _alphabet;
  String _soundPath;

  set alphabet(String alphabet) => this._alphabet = alphabet;
  String get alphabet => this._alphabet;
  set soundPath(String soundPath) => this._soundPath = soundPath;
  String get soundPath => this._soundPath;
}
