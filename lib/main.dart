import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shampoo_provider.dart';
import 'page1.dart';

void main() {
  runApp(
    ChangeNotifierProvider(//esto es para usar el provider en toda la app.
      create: (_) => ShampooProvider(),//creamos el provider
      child: const MyApp(),//llamamos a la app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(//app principal
      home: Page1(),//definimos la pagina inicial que es Page1.
    );
  }
}
