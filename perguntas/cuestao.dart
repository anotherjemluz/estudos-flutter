import 'package:flutter/material.dart';

class Cuestao extends StatelessWidget {
  // classe stateless deve ter apenas atributos finais
  final String texto;
  Cuestao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Text(
        texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
