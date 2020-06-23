import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './cuestionario.dart';
import './gabarito.dart';

main() => runApp(new App());

// estado da aplicação
class _AppState extends State<App> {  
  var _questionSelected = 0;
  var _totalScore = 0;
  final _questionsList = const [ 
    {
      'texto': 'Vc é gay?',
      'respostas': [
        { 'texto': 'nunca fui', 'nota': 12}, 
        { 'texto': 'quem te disse isso?', 'nota': 5}, 
        { 'texto': 'tu q é', 'nota': 8}
      ]
    },
    {
      'texto': 'Ei cara tu é gay?',
      'respostas': [
        { 'texto': 'sim', 'nota': 18}, 
        { 'texto': 'talvez', 'nota': 1}
      ]
    }
  ];

  void _lesponde(int score) {
    if(isQuestionSelected) {
      setState(() {
        _questionSelected++;
        _totalScore += score;
      });
    }
  }

  void _restart() {
    setState(() {
      _questionSelected = 0;
      _totalScore = 0;
    });
  }

  bool get isQuestionSelected {
    return _questionSelected < _questionsList.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('é melhor você medir')),
        body: isQuestionSelected ? Cuestionario(
          questionsList: _questionsList,
          questionSelected: _questionSelected,
          lesponde: _lesponde,
        )
        : Gabarito(_totalScore, _restart),
      ),
    );
  }
}

// applicação
class App extends StatefulWidget {
  _AppState createState() {
    return _AppState();
  }
}
