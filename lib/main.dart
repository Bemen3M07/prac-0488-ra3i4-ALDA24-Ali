import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shampoo_provider.dart';
import 'page1.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ShampooProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Page1(),
    );
  }
}
