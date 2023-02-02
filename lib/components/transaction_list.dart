import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

// Refatoração = retirei o código do arquivo main e tornei um arquivo próprio para que possa ser utilizado de forma mais minimalista

// Componente que representa a coluna para cada um dos elementos que representam uma transação da nossa lista

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {


    // ListView - O ideal é trabalhar com o ListView desta maneira, pois quado não sabemos o quão grande pode chagar o tamanho da lista, .builder pode gerar gradativamente o conteúdo sem ocupar memória mais do que o necessário 
    return  Container(
      height: 300,

      child: ListView.builder(
          itemCount: transactions.length,
          // INDEX = um elemento que você quer, digamos assim: que seja renderizado na chamada dessa função.
          itemBuilder: ((context, index) {
            final tr = transactions[index];
    
            return Card(
                elevation: 10,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                      horizontal: 15, 
                      vertical: 10),
    
                      decoration: BoxDecoration(
                        border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      )),
                      padding: EdgeInsets.all(10),
                      child: new Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text(
                          tr.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Row(
                          children: [
                            new Text(
                              DateFormat('d/MMM/y').format(tr.date),
                              style: TextStyle(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FaIcon(
                              FontAwesomeIcons.clock,
                              size: 17,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 4),
                            new Text(
                              DateFormat.Hms().format(tr.date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
                );
          }
          )
          ),
    );
        // children: transactions.map((tr) {}).toList());
  }
}
