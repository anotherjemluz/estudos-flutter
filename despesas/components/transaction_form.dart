import 'package:flutter/material.dart';

import 'adaptative_button.dart';
import 'adaptative_textfield.dart';
import 'adaptative_datepicker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) callDadFunction;

  TransactionForm(this.callDadFunction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleCtrl = TextEditingController();
  final _valueCtrl = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleCtrl.text;
    final value = double.tryParse(_valueCtrl.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) return;

    widget.callDadFunction(title, value, _selectedDate);
  }

  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                label: 'Título da despesa',
                ctrl: _titleCtrl,
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeTextField(
                label: 'Valor (R\$)',
                ctrl: _valueCtrl,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChange: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Nova transação',
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
