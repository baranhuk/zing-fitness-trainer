import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class Button extends StatelessWidget {
  final String text;
  Button({this.text});

  @override
  Widget build(BuildContext context) {
    var colors = new MyColors();
    return Container(
      child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width -
              (MediaQuery.of(context).size.width / 7),
          height: 60,
          child: RaisedButton(
            child: Text(text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                )),
            color: colors.deepBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              print('object');
            },
          )),
    );
  }
}