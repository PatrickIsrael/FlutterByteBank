import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _tituloAppBar = 'Tansferências';

// ignore: use_key_in_widget_constructors
class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index) {
          final transferencia = widget._transferencias[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FormularioTransferencia();
          })).then(
            (transferenciaRecebida) =>
                _atualizaListaTransferencias(transferenciaRecebida),
          );
        }, //é necessário passar o parâmetro para rodar
        child: const Icon(Icons.add),
      ),
    );
  }

  void _atualizaListaTransferencias(Transferencia? transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat.simpleCurrency();
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(formatter.format(_transferencia.valor)),
        subtitle: Text('${_transferencia.numeroConta}-${_transferencia.digito}'),
      ),
    );
  }
}
