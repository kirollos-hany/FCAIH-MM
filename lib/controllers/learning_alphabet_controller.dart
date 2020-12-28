import '../models/learnalphabets.dart';

class LearningAlphabetController {
  List<LearnAlphabets> _gameList;
  int _index;
  LearningAlphabetController() {
    _initGameList();
    _index = 0;
  }

  void _initGameList() {
    _gameList = [];
    // 7arf l أ
    _gameList.add(LearnAlphabets("أ", "audios/a.mp3"));

    // 7arf l ب
    _gameList.add(LearnAlphabets("ب", "audios/beh.mkv"));

    //7arf l ت
    _gameList.add(LearnAlphabets("ت", "audios/teh.mp3"));

    //7arf l ث
    _gameList.add(LearnAlphabets("ث", "audios/theh.mp3"));

    //7arf l ج
    _gameList.add(LearnAlphabets("ج", "audios/geem.mp3"));

    //7arf l ح
    _gameList.add(LearnAlphabets("ح", "audios/hah.mp3"));

    //7arf l خ
    _gameList.add(LearnAlphabets("خ", "audios/khah.mp3"));

    //7arf l د
    _gameList.add(LearnAlphabets("د", "audios/dal.mp3"));

    //7arf l ذ
    _gameList.add(LearnAlphabets("ذ", "audios/zal.mp3"));

    //7arf l ر
    _gameList.add(LearnAlphabets("ر", "audios/re.mp3"));

    //7arf l ز
    _gameList.add(LearnAlphabets("ز", "audios/za.mp3"));

    //7arf l س
    _gameList.add(LearnAlphabets("س", "audios/sen.mp3"));

    //7arf l ش
    _gameList.add(LearnAlphabets("ش", "audios/shen.mp3"));

    //7arf l ص
    _gameList.add(LearnAlphabets("ص", "audios/sad.mp3"));

    //7arf l ض
    _gameList.add(LearnAlphabets("ض", "audios/dad.mp3"));

    //7arf l ط
    _gameList.add(LearnAlphabets("ط", "audios/tah.mp3"));

    //7arf l ظ
    _gameList.add(LearnAlphabets("ظ", "audios/za.mp3"));

    //7arf l ع
    _gameList.add(LearnAlphabets("ع", "audios/3en.mp3"));

    //7arf l غ
    _gameList.add(LearnAlphabets("غ", "audios/8en.mp3"));

    //7arf l ف
    _gameList.add(LearnAlphabets("ف", "audios/feh.mp3"));

    //7arf l ق
    _gameList.add(LearnAlphabets("ق", "audios/kaf.mp3"));

    //7arf l ك
    _gameList.add(LearnAlphabets("ك", "audios/kaff.mp3"));

    //7arf l ل
    _gameList.add(LearnAlphabets("ل", "audios/lam.mp3"));

    //7arf l م
    _gameList.add(LearnAlphabets("م", "audios/mem.mp3"));

    //7arf l ن
    _gameList.add(LearnAlphabets("ن", "audios/non.mp3"));

    //7arf l ه
    _gameList.add(LearnAlphabets("ه", "audios/heh.mp3"));

    //7arf l و
    _gameList.add(LearnAlphabets("و", "audios/waw.mp3"));

    //7arf l ي
    _gameList.add(LearnAlphabets("ي", "audios/yeh.mp3"));
  }

  String getFirstAlphabet() {
    _index = 0;
    return _gameList[_index].alphabet;
  }

  String getNextAlphabet() => _gameList[(++_index) % _gameList.length].alphabet;

  String getPrevAlphabet() {
    if (_index != 0) return _gameList[--_index].alphabet;
    return _gameList[_index].alphabet;
  }

  String getCurrentSound() {
    return _gameList[_index].soundPath;
  }
}
