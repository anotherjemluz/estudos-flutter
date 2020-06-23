import 'package:flutter/material.dart';

import 'cuestao.dart';
import 'resposta.dart';

class Cuestionario extends StatelessWidget {
  final List<Map<String, Object>> questionsList;
  final int questionSelected;
  final void Function(int) lesponde;

  Cuestionario(
      {@required this.questionsList,
      @required this.questionSelected,
      @required this.lesponde});
  
  bool get isQuestionSelected {
    return questionSelected < questionsList.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = isQuestionSelected
        ? questionsList[questionSelected]['respostas']
        : null;

    return Column(
      children: <Widget>[
        Cuestao(questionsList[questionSelected]['texto']),
        ...answers.map((r) {
          return Resposta(
            r['texto'], 
            () => lesponde(r['nota'])
          );
        }).toList(),
      ],
    );
  }
}