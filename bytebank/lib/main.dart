import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  runApp(const ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: primaryGreen(),
        ).copyWith(
          secondary: Colors.cyanAccent[700],
        ),
        //Botão de confirmar
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: Colors.cyanAccent[700],
        )),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.normal),
      ),
      home: ListaTransferencias(),
    );
  }
}

MaterialColor primaryGreen() {
  return MaterialColor(
    0xFF2E7D32,
    {
      50: Colors.green[50]!,
      100: Colors.green[100]!,
      200: Colors.green[200]!,
      300: Colors.green[300]!,
      500: Colors.green[500]!,
      600: Colors.green[600]!,
      700: Colors.green[700]!,
      800: Colors.green[800]!,
      900: Colors.green[900]!,
    },
  );
}

