
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? _controlador;
  final String? _rotulo;
  final String? _dica;
  final IconData? _icon;
  final int? _length;

  const Editor(
      {Key? key,
        required TextEditingController controlador,
        required String rotulo,
        required String dica,
        IconData? icone,
        int? length})
      : _controlador = controlador,
        _rotulo = rotulo,
        _dica = dica,
        _icon = icone,
        _length = length,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
      child: TextField(
        controller: _controlador,
        maxLength: _length,
        decoration: InputDecoration(
          icon: _icon != null ? Icon(_icon) : null,
          labelText: _rotulo,
          hintText: _dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}