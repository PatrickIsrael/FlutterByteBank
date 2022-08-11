import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '00000';
const _tamanhoCampoNumeroConta = 5;

const _rotuloCampoDigito = 'Dígito';
const _dicaCampoDigito = '0';
const _tamanhoCampoDigito = 1;

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoDigitoConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoNumeroConta,
                length: _tamanhoCampoNumeroConta,
              ),
              Editor(
                controlador: _controladorCampoDigitoConta,
                rotulo: _rotuloCampoDigito,
                dica: _dicaCampoDigito,
                length: _tamanhoCampoDigito,
              ),
              Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                onPressed: () => _criarTransferencia(context),
                child: const Text(_textoBotaoConfirmar),
              ),
            ],
          ),
        ));
  }

  void _criarTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final int? digitoConta = int.tryParse(_controladorCampoDigitoConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null && digitoConta != null) {
      final transferenciaCriada =
          Transferencia(valor, numeroConta, digitoConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
