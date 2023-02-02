
// Classe modelo que representa uma transação
class Transaction {

  // Atributos 
  final String id;
  final String title;
  final double value;
  final DateTime date;

  // Construtor que vai receber os atributos nomeados
  Transaction({
   required this.id,
   required this.title,
   required this.value,
   required this.date
    
    });
}
