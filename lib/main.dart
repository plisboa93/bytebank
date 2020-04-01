import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    body: ListaTransferencias(),
    appBar: AppBar(
      title: Text('Transferências'),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
    ),
  ),
));

class ListaTransferencias extends StatelessWidget {                      
  @override 
  Widget build(BuildContext context){

    return Column(
      children: <Widget>[
        ItemTransferencia(),
        ItemTransferencia(),
        ItemTransferencia(),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final String valor;
  final String numeroConta;

  ItemTransferencia(this.valor, this.numeroConta);

  

 @override 
 Widget build(BuildContext context){
   return Card(
     child: ListTile(
       leading: Icon(Icons.monetization_on),
       title: Text('5000.0'),
       subtitle: Text('16000'),
     )
   );
 }
}