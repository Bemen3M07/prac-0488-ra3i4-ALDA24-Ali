import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shampoo.dart';
import 'shampoo_provider.dart';
import 'page2.dart';

//aqui es necesario un StatefulWidget para mantener la selección
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

//aqui se hace el mantenimiento de la selección
class _Page1State extends State<Page1> {
  Shampoo? seleccionat;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ShampooProvider>(context);//se obtiene el provider

    // Mantenemos la selección al volver desde Page2
    seleccionat = prov.seleccionat;

    return Scaffold(
      appBar: AppBar(title: const Text("Shampoo App")),
     body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownMenu<Shampoo>(
              initialSelection: seleccionat,
              hintText: "Selecciona un shampoo",
              dropdownMenuEntries: shampus
                  .map(
                    (s) => DropdownMenuEntry<Shampoo>(
                      value: s,
                      label: s.marca,
                    ),
                  )
                  .toList(),
              onSelected: (value) {
                setState(() {
                  seleccionat = value;
                });
                if (value != null) prov.seleccionar(value);
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (seleccionat != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Page2()),
                  );
                }
              },
              child: const Text("Anar a la segona pàgina"),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
