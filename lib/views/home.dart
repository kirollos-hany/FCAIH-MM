import 'package:fcaih_mm/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../custom_widgets/button.dart';
import '../constants/dimensions.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
            image: AssetImage(HOME_BG_IMG),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: OrangeButton(MATCHING_GAME_TITLE, _onBtnPressed),
                    margin: EdgeInsets.only(
                        left: HOME_BTNS_SIDE_MARGIN,
                        bottom: HOME_UPPER_BTN_BOT_MARGIN,
                        right: HOME_BTNS_SIDE_MARGIN),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child:
                        OrangeButton(LEARN_ALPHABETS_GAME_TITLE, _onBtnPressed),
                    margin: EdgeInsets.only(
                        left: HOME_BTNS_SIDE_MARGIN,
                        bottom: HOME_LOWER_BTN_BOT_MARGIN,
                        right: HOME_BTNS_SIDE_MARGIN),
                  )
                ],
              ),
            ))
      ],
    );
  }

  void _onBtnPressed() {
    return;
  }
}
