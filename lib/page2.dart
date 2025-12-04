import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shampoo_provider.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ShampooProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Detalls del Shampoo")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Marca: ${prov.seleccionat?.marca ?? ''}"),
            Text("Quantitat envas: ${prov.quantitatInicial} ml"),
            Text(
              "Queda: ${prov.quantitatQueda} ml",
              style: TextStyle(
                color: prov.esVermell() ? Colors.red : Colors.black,
              ),
            ),
            Text("Gastat: ${prov.quantitatGastada} ml"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                prov.restarDosi();
              },
              child: const Text("Restar dosi (12 ml)"),
            ),
          ],
        ),
      ),
    );
  }
}
