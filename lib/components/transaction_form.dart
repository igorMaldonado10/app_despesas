import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
 
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

// No momento que o usuário informar o valor e clicar no check do teclado (ou seja submeter a informação), eu não vou forçar o usuário a apertar no botão de 'nova transação'
  void _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    //  tradução^
    //  caso não funcione (final value = double.tryParse(valueController.text), não consiga converter de forma correta, qual é o valor que você quer dar por padrão a essa varíavel (no caso o value), será o ?? (número).
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            new TextField(
              // onChanged: (newValue) => title = newValue,
              controller: titleController,
              onSubmitted: (value) => _submitForm(),
              decoration: InputDecoration(labelText: 'Título'),
            ),
            new TextField(
              // onChanged: (newValue) => value = newValue,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              // No caso fosse IOS teria que colocar
              //.numberWithOptions para que pudesse aparecer o teclado igual ao Android + decimal: true
              onSubmitted: (value) => _submitForm(),
              controller: valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                    child: new Text('Limpar'), onPressed: (() => Limpar())),
                FlatButton(
                  child: new Text('Nova transação'),
                  textColor: Colors.purple,
                  onPressed: () =>
                    _submitForm()
                  
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void Limpar() {
    this.titleController.text = '';
    this.valueController.text = '';
  }
}
