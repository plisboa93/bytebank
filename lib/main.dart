import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());


class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
       body: FormularioTransferencia(),
     ),
    );
  }
}


class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferência'),),
       body: Column(
         children: <Widget>[
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: TextField(
               style: TextStyle(
                 fontSize : 20.0,
               ),
               controller: _controladorCampoNumeroConta,
               decoration: InputDecoration(
                 labelText: 'Numero da Conta',
                 hintText: '0000'
               ),
               keyboardType: TextInputType.number,
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: TextField(
               controller: _controladorCampoValor,
               style: TextStyle(
                 fontSize : 20.0,),
               decoration: InputDecoration(
                 icon: Icon(Icons.monetization_on),
                 labelText: 'Valor',
                  hintText: '0.00'),
               keyboardType: TextInputType.number,
             ),
           ),
          RaisedButton(
            child: Text('Confirmar'), 
            onPressed: () {
              debugPrint('clicou no confirmar');
              final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
              
              final double valor = double.tryParse(_controladorCampoValor.text);
              
              if (numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$transferenciaCriada'),
                  )
                )
              }
            },
          ),
        ],
      ),);
  }
}


// class ListaTransferencias extends StatelessWidget {                      
//   @override 
//   Widget build(BuildContext context){

//     return Scaffold(
//       appBar: AppBar(title: Text('Transferências'),
//       ),
//         body: Column(
//           children: <Widget>[
//            ItemTransferencia(Transferencia(100.0, 1000)),
//            ItemTransferencia(Transferencia(200.0, 5000)),
//            ItemTransferencia(Transferencia(300.0, 12000)),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//       child: Icon(Icons.add),
//       ),
//     );
//   }
// }


class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  final int numeroConta;

  Transferencia(this._transferencia, this.numeroConta);
  

 @override
  String toString() {
  return 'Transferencia{valor: $valor, numeroConta: $numeroConta';
   }
}


class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

}