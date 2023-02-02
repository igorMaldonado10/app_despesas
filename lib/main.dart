import 'dart:ui';

import 'package:app_despesas_pessoais/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'models/transaction.dart';
import './components/transaction_form.dart';
import './components/transaction_list.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

    return MaterialApp(  
      home: MyHomePage(),
      // Theme = Propriede
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber
        ),
       
       textTheme: tema.textTheme.copyWith(
        headline6: TextStyle(
          fontFamily: 'QuickSand',
          fontSize: 18,
          // fontWeight: FontWeight.bold,
          color: Colors.black, 
          
        ),
       ), 
       appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 20,
          color: Colors.white
          // fontWeight: FontWeight.bold,
        )
       )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*String title = '';
  String value = '';*/
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tênis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    transacaoPlusFast('t2', 'Conta de Luz', 211.30, DateTime.now())
  ];

  void _addTransaction(String title, double value) {
    
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        // Atributo nomeado : parâmetro que recebi pela função
        title: title,
        value: value,
        date: DateTime.now());
    

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
    
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: ((context) {
          return TransactionForm(_addTransaction);
        }));
    // Fechar Modal
   
  }

  @override
  Widget build(BuildContext context) {
    bool checkValue = true;
    return Scaffold(
      appBar: AppBar(
        title: new Text('Despesas Pessoais'),
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: FaIcon(FontAwesomeIcons.plus))
        ],
      ),
      body: SingleChildScrollView(
        // O componemnte pai ele tem que ter um tamnho pré-definido para que ele possa funcionar normalmente;
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: Card(
                child: new Text('Gráfico'),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            TransactionList(_transactions),

    //         Container(
    //   height: 600,
    //   width: 300,
    //   child: new Column(children: [
    //     Checkbox(
            
    //         value: checkValue,
    //         onChanged: (bool? value) {
    //           setState(() {
    //             checkValue:
    //             value;
    //           });
    //         }),
    //   ]),
    // )

            // - TextField associado ao título;
            // - Textfield associado ao valor da transação;
            // - Botão dentro da coluna

            // Usuário mexer no formulário(Form), o formulário notificar o TransactionUser e automaticamente adicionar uma nova transação nessa lista (Por isso que o TransactionUser é uma class do tipo Statefull)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.plus,
          color: Colors.black,),
          onPressed: () => _openTransactionFormModal(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Transaction transacaoPlusFast(
    String id, String title, double value, DateTime dateTime) {
  return Transaction(id: id, title: title, value: value, date: dateTime);
}
