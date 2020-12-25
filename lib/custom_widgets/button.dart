import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants/strings.dart';
import '../constants/dimensions.dart';

class OrangeButton extends StatelessWidget {
  OrangeButton(this._text, this._onPressed);
  final String _text;
  final Function _onPressed;
  final int _btnColor = 0xFFFFD628;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: _onPressed,
      child: Text(_text,
          style: TextStyle(
              fontFamily: FONT_FAMILY,
              fontSize: HOME_BTNS_TEXT_SIZE,
              fontWeight: FontWeight.bold)),
      textColor: Colors.white,
      color: Color(_btnColor),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(HOME_BTNS_BORDER_RADIUS),
          side: BorderSide(color: Color(_btnColor))),
      minWidth: double.maxFinite,
    );
  }
}
