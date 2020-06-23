import 'package:flutter/material.dart';

class Gabarito extends StatelessWidget {
  final int score;
  final void Function() whenRestart;

  Gabarito(this.score, this.whenRestart);

  String get title {
    if (score < 15) {
      return 'top';
    } else return 'bosta';
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 28),
          )
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18)
          ),
          textColor: Colors.blue,
          onPressed: whenRestart,
        )
      ],
    );
  }
}