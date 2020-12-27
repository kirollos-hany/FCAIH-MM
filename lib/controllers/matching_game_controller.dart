import 'dart:math';

import '../models/gameimage.dart';

class MatchingGameController {
  List<GameImage> _gameImages;
  List<String> _answers;
  String _letterToShow;
  List<GameImage> _currentGameImages;
  static final MatchingGameController singleton = MatchingGameController._();

  factory MatchingGameController() => singleton;

  List<GameImage> get currentGameImages => _currentGameImages;
  String get letterToShow => _letterToShow;
  final int _numOfPlays = 84;

  int get numOfPlays => _numOfPlays;

  MatchingGameController._() {
    _initGameAnswers();
    _initGameImages();
    updateCurrentGameState();
    updateLetterToShow();
  }

  void _initGameImages() {
    _gameImages = [];
    int answersIndex = 0;
    // 7arf el أ
    GameImage lionGameImg =
        GameImage("assets/images/أ/lion.png", "أسد", _answers[answersIndex]);
    _gameImages.add(lionGameImg);
    GameImage princessGameImg = GameImage(
        "assets/images/أ/princess.png", "أميرة", _answers[answersIndex]);
    _gameImages.add(princessGameImg);
    GameImage rabbitGameImg =
        GameImage("assets/images/أ/rabbit.png", "أرنب", _answers[answersIndex]);
    _gameImages.add(rabbitGameImg);

    // 7arf l ب
    GameImage cowGameImg =
        GameImage("assets/images/ب/cow.png", "بقرة", _answers[++answersIndex]);
    _gameImages.add(cowGameImg);
    GameImage duckGameImg =
        GameImage("assets/images/ب/duck.png", "بطة", _answers[answersIndex]);
    _gameImages.add(duckGameImg);
    GameImage orangeGameImg = GameImage(
        "assets/images/ب/orange.png", "برتقان", _answers[answersIndex]);
    _gameImages.add(orangeGameImg);

    // 7arf el ت
    GameImage appleGameImage = GameImage(
        "assets/images/ت/apple.png", "تفاحة", _answers[++answersIndex]);
    _gameImages.add(appleGameImage);
    GameImage crocodileGameImage = GameImage(
        "assets/images/ت/crocodile.png", "تمساح", _answers[answersIndex]);
    _gameImages.add(crocodileGameImage);
    GameImage crownGameImage =
        GameImage("assets/images/ت/crown.png", "تاج", _answers[answersIndex]);
    _gameImages.add(crownGameImage);

    // 7arf l ث
    GameImage foxGameImage =
        GameImage("assets/images/ث/fox.png", "ثعلب", _answers[++answersIndex]);
    _gameImages.add(foxGameImage);
    GameImage snakeGameImage =
        GameImage("assets/images/ث/snake.png", "ثعبان", _answers[answersIndex]);
    _gameImages.add(snakeGameImage);
    GameImage threeGameImage =
        GameImage("assets/images/ث/three.png", "ثلاثة", _answers[answersIndex]);
    _gameImages.add(threeGameImage);

    // 7arf l ج
    GameImage bellGameImage =
        GameImage("assets/images/ج/bell.png", "جرس", _answers[++answersIndex]);
    _gameImages.add(bellGameImage);
    GameImage camelGameImage =
        GameImage("assets/images/ج/camel.png", "جمل", _answers[answersIndex]);
    _gameImages.add(camelGameImage);
    GameImage carrotsGameImage =
        GameImage("assets/images/ج/carrots.png", "جزر", _answers[answersIndex]);
    _gameImages.add(carrotsGameImage);

    // 7arf l ح
    GameImage donkeyGameImage = GameImage(
        "assets/images/ح/donkey.png", "حمار", _answers[++answersIndex]);
    _gameImages.add(donkeyGameImage);
    GameImage hodGameImage =
        GameImage("assets/images/ح/hod.png", "حوض", _answers[answersIndex]);
    _gameImages.add(hodGameImage);
    GameImage parkGameImage =
        GameImage("assets/images/ح/park.png", "حديقة", _answers[answersIndex]);
    _gameImages.add(parkGameImage);

    // 7arf l خ
    GameImage breadGameImage =
        GameImage("assets/images/خ/bread.png", "خبز", _answers[++answersIndex]);
    _gameImages.add(breadGameImage);
    GameImage peachesGameImage =
        GameImage("assets/images/خ/peaches.png", "خوخ", _answers[answersIndex]);
    _gameImages.add(peachesGameImage);
    GameImage peasGameImage =
        GameImage("assets/images/خ/peas.png", "خرز", _answers[answersIndex]);
    _gameImages.add(peasGameImage);

    // 7arf l د
    GameImage bicycleGameImage = GameImage(
        "assets/images/د/bicycle.png", "دراجة", _answers[++answersIndex]);
    _gameImages.add(bicycleGameImage);
    GameImage bucketGameImage =
        GameImage("assets/images/د/bucket.png", "دلو", _answers[answersIndex]);
    _gameImages.add(bucketGameImage);
    GameImage chickenGameImage = GameImage(
        "assets/images/د/chicken.png", "دجاجة", _answers[answersIndex]);
    _gameImages.add(chickenGameImage);

    // 7arf l ذ
    GameImage armGameImage =
        GameImage("assets/images/ذ/arm.png", "ذراع", _answers[++answersIndex]);
    _gameImages.add(armGameImage);
    GameImage goldGameImage =
        GameImage("assets/images/ذ/gold.png", "ذهب", _answers[answersIndex]);
    _gameImages.add(goldGameImage);
    GameImage wolfGameImage =
        GameImage("assets/images/ذ/wolf.png", "ذئب", _answers[answersIndex]);
    _gameImages.add(wolfGameImage);

    // 7arf l ر
    GameImage featherGameImage = GameImage(
        "assets/images/ر/feather.png", "ريشة", _answers[++answersIndex]);
    _gameImages.add(featherGameImage);
    GameImage pommegranteGameImage = GameImage(
        "assets/images/ر/pommegrante.png", "رمان", _answers[answersIndex]);
    _gameImages.add(pommegranteGameImage);
    GameImage spearGameImage =
        GameImage("assets/images/ر/spear.png", "رمح", _answers[answersIndex]);
    _gameImages.add(spearGameImage);

    // 7arf l ز
    GameImage buttonGameImage =
        GameImage("assets/images/ز/button.png", "زر", _answers[++answersIndex]);
    _gameImages.add(buttonGameImage);
    GameImage flowersGameImage = GameImage(
        "assets/images/ز/flowers.png", "زهور", _answers[answersIndex]);
    _gameImages.add(flowersGameImage);
    GameImage giraffeGameImage = GameImage(
        "assets/images/ز/giraffe.png", "زرافة", _answers[answersIndex]);
    _gameImages.add(giraffeGameImage);

    // 7arf l س
    GameImage boardGameImage = GameImage(
        "assets/images/س/board.png", "سبورة", _answers[++answersIndex]);
    _gameImages.add(boardGameImage);
    GameImage carGameImage =
        GameImage("assets/images/س/car.png", "سيارة", _answers[answersIndex]);
    _gameImages.add(carGameImage);
    GameImage clockGameImage =
        GameImage("assets/images/س/clock.png", "ساعة", _answers[answersIndex]);
    _gameImages.add(clockGameImage);

    // 7arf l ش
    GameImage screenGameImage = GameImage(
        "assets/images/ش/screen.png", "شاشة", _answers[++answersIndex]);
    _gameImages.add(screenGameImage);
    GameImage sunGameImage =
        GameImage("assets/images/ش/sun.png", "شمس", _answers[answersIndex]);
    _gameImages.add(sunGameImage);
    GameImage treeGameImage =
        GameImage("assets/images/ش/tree.png", "شجرة", _answers[answersIndex]);
    _gameImages.add(treeGameImage);

    // 7arf l ص
    GameImage boxGameImage =
        GameImage("assets/images/ص/box.png", "صندوق", _answers[++answersIndex]);
    _gameImages.add(boxGameImage);
    GameImage eagleGameImage =
        GameImage("assets/images/ص/eagle.png", "صقر", _answers[answersIndex]);
    _gameImages.add(eagleGameImage);
    GameImage whistleGameImage = GameImage(
        "assets/images/ص/whistle.png", "صفارة", _answers[answersIndex]);
    _gameImages.add(whistleGameImage);

    // 7arf l ض
    GameImage dersGameImage =
        GameImage("assets/images/ض/ders.png", "ضرس", _answers[++answersIndex]);
    _gameImages.add(dersGameImage);
    GameImage frogGameImage =
        GameImage("assets/images/ض/frog.png", "ضفدع", _answers[answersIndex]);
    _gameImages.add(frogGameImage);
    GameImage officerGameImage = GameImage(
        "assets/images/ض/officer.png", "ضابظ", _answers[answersIndex]);
    _gameImages.add(officerGameImage);

    // 7arf l ط
    GameImage drumsGameImage =
        GameImage("assets/images/ط/drums.png", "طبل", _answers[++answersIndex]);
    _gameImages.add(drumsGameImage);
    GameImage planeGameImage =
        GameImage("assets/images/ط/plane.png", "طائرة", _answers[answersIndex]);
    _gameImages.add(planeGameImage);
    GameImage tomatoGameImage = GameImage(
        "assets/images/ط/tomato.png", "طماطم", _answers[answersIndex]);
    _gameImages.add(tomatoGameImage);

    //7arf l ظ
    GameImage envelopeGameImage = GameImage(
        "assets/images/ظ/envelope.png", "ظرف", _answers[++answersIndex]);
    _gameImages.add(envelopeGameImage);
    GameImage shadowGameImage =
        GameImage("assets/images/ظ/shadow.png", "ظل", _answers[answersIndex]);
    _gameImages.add(shadowGameImage);
    GameImage zabiGameImage =
        GameImage("assets/images/ظ/zabi.png", "ظبي", _answers[answersIndex]);
    _gameImages.add(zabiGameImage);

    //7arf l ع
    GameImage birdGameImage = GameImage(
        "assets/images/ع/bird.png", "عصفور", _answers[++answersIndex]);
    _gameImages.add(birdGameImage);
    GameImage grapeGameImage =
        GameImage("assets/images/ع/grape.png", "عنب", _answers[answersIndex]);
    _gameImages.add(grapeGameImage);
    GameImage honeyGameImage =
        GameImage("assets/images/ع/honey.png", "عسل", _answers[answersIndex]);
    _gameImages.add(honeyGameImage);

    //7arf l غ
    GameImage branchGameImage = GameImage(
        "assets/images/غ/branch.png", "غصن", _answers[++answersIndex]);
    _gameImages.add(branchGameImage);
    GameImage crowGameImage =
        GameImage("assets/images/غ/crow.png", "غراب", _answers[answersIndex]);
    _gameImages.add(crowGameImage);
    GameImage reindeerGameImage = GameImage(
        "assets/images/غ/reindeer.png", "غزال", _answers[answersIndex]);
    _gameImages.add(reindeerGameImage);

    //7arf l ف
    GameImage elephantGameImage = GameImage(
        "assets/images/ف/elephant.png", "فيل", _answers[++answersIndex]);
    _gameImages.add(elephantGameImage);
    GameImage pantherGameImage =
        GameImage("assets/images/ف/panther.png", "فهد", _answers[answersIndex]);
    _gameImages.add(pantherGameImage);
    GameImage strawberryGameImage = GameImage(
        "assets/images/ف/strawberry.png", "فراولة", _answers[answersIndex]);
    _gameImages.add(strawberryGameImage);

    //7arf l ق
    GameImage lockGameImage =
        GameImage("assets/images/ق/lock.png", "قفل", _answers[++answersIndex]);
    _gameImages.add(lockGameImage);
    GameImage pencilGameImage =
        GameImage("assets/images/ق/pencil.png", "قلم", _answers[answersIndex]);
    _gameImages.add(pencilGameImage);
    GameImage trainGameImage =
        GameImage("assets/images/ق/train.png", "قطار", _answers[answersIndex]);
    _gameImages.add(trainGameImage);

    //7arf l ك
    GameImage dogGameImage =
        GameImage("assets/images/ك/dog.png", "كلب", _answers[++answersIndex]);
    _gameImages.add(dogGameImage);
    GameImage ballGameImage =
        GameImage("assets/images/ك/ball.png", "كرة", _answers[answersIndex]);
    _gameImages.add(ballGameImage);
    GameImage chairGameImage =
        GameImage("assets/images/ك/chair.png", "كرسي", _answers[answersIndex]);
    _gameImages.add(chairGameImage);

    //7arf l ل
    GameImage lemonGameImage = GameImage(
        "assets/images/ل/lemon.png", "ليمون", _answers[++answersIndex]);
    _gameImages.add(lemonGameImage);
    GameImage meatGameImage =
        GameImage("assets/images/ل/meat.png", "لحم", _answers[answersIndex]);
    _gameImages.add(meatGameImage);
    GameImage milkGameImage =
        GameImage("assets/images/ل/milk.png", "لبن", _answers[answersIndex]);
    _gameImages.add(milkGameImage);

    //7arf l م
    GameImage boatGameImage =
        GameImage("assets/images/م/boat.png", "مركب", _answers[++answersIndex]);
    _gameImages.add(boatGameImage);
    GameImage goatGameImage =
        GameImage("assets/images/م/goat.png", "ماعز", _answers[answersIndex]);
    _gameImages.add(goatGameImage);
    GameImage keyGameImage =
        GameImage("assets/images/م/key.png", "مفتاح", _answers[answersIndex]);
    _gameImages.add(keyGameImage);

    //7arf l ن
    GameImage beeGameImage =
        GameImage("assets/images/ن/bee.png", "نحلة", _answers[++answersIndex]);
    _gameImages.add(beeGameImage);
    GameImage tigerGameImage =
        GameImage("assets/images/ن/tiger.png", "نمر", _answers[answersIndex]);
    _gameImages.add(tigerGameImage);
    GameImage riverGameImage =
        GameImage("assets/images/ن/river.png", "نهر", _answers[answersIndex]);
    _gameImages.add(riverGameImage);

    //7arf l ه
    GameImage giftGameImage =
        GameImage("assets/images/ه/gift.png", "هدية", _answers[++answersIndex]);
    _gameImages.add(giftGameImage);
    GameImage moonGameImage =
        GameImage("assets/images/ه/moon.png", "هلال", _answers[answersIndex]);
    _gameImages.add(moonGameImage);
    GameImage phoneGameImage =
        GameImage("assets/images/ه/phone.png", "هاتف", _answers[answersIndex]);
    _gameImages.add(phoneGameImage);

    //7arf l و
    GameImage fuelGameImage =
        GameImage("assets/images/و/fuel.png", "وقود", _answers[++answersIndex]);
    _gameImages.add(fuelGameImage);
    GameImage pillowGameImage = GameImage(
        "assets/images/و/pillow.png", "وسادة", _answers[answersIndex]);
    _gameImages.add(pillowGameImage);
    GameImage scarfGameImage =
        GameImage("assets/images/و/scarf.png", "وشاح", _answers[answersIndex]);
    _gameImages.add(scarfGameImage);

    //7arf l ي
    GameImage handGameImage =
        GameImage("assets/images/ي/hand.png", "يد", _answers[++answersIndex]);
    _gameImages.add(handGameImage);
    GameImage pumpkinGameImage = GameImage(
        "assets/images/ي/pumpkin.png", "يقطينة", _answers[answersIndex]);
    _gameImages.add(pumpkinGameImage);
    GameImage yasobGameImage =
        GameImage("assets/images/ي/yasob.png", "يعسوب", _answers[answersIndex]);
    _gameImages.add(yasobGameImage);
  }

  void _initGameAnswers() {
    _answers = [];
    _answers.add("أ");
    _answers.add("ب");
    _answers.add("ت");
    _answers.add("ث");
    _answers.add("ج");
    _answers.add("ح");
    _answers.add("خ");
    _answers.add("د");
    _answers.add("ذ");
    _answers.add("ر");
    _answers.add("ز");
    _answers.add("س");
    _answers.add("ش");
    _answers.add("ص");
    _answers.add("ض");
    _answers.add("ط");
    _answers.add("ظ");
    _answers.add("ع");
    _answers.add("غ");
    _answers.add("ف");
    _answers.add("ق");
    _answers.add("ك");
    _answers.add("ل");
    _answers.add("م");
    _answers.add("ن");
    _answers.add("ه");
    _answers.add("و");
    _answers.add("ي");
  }

  bool isChoiceCorrect(int choiceIndex, String answer) =>
      _currentGameImages[choiceIndex].answer == answer ? true : false;

  void removeGameImage(int index) =>
      _gameImages.remove(_currentGameImages[index]);

  void updateCurrentGameState() {
    List<GameImage> temp = [];
    bool flag = true;
    int numOfImgsAdded = 0;
    Random random = Random();
    int i = 0;
    while (flag && i < _gameImages.length) {
      int randomIndex = random.nextInt(_gameImages.length);
      if (i == 0) {
        temp.add(_gameImages[randomIndex]);
        numOfImgsAdded++;
      } else if (temp[i - 1].answer != _gameImages[randomIndex].answer) {
        temp.add(_gameImages[randomIndex]);
        numOfImgsAdded++;
      }
      i++;
      if (numOfImgsAdded == 3) flag = false;
    }
    _currentGameImages = temp;
  }

  void updateLetterToShow() => _letterToShow =
      _currentGameImages[Random().nextInt(_currentGameImages.length)].answer;

  String getImgDesc(int chosenIndex) => _currentGameImages[chosenIndex].imgDesc;
}
