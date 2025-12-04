import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shampoo.dart';
import 'shampoo_provider.dart';
import 'page2.dart';

//LA PAGINA PRINCIPAL DONDE SE SELECCIONA EL SHAMPOO. PAGE1.

// StatefulWidget necesario para mantener la selección en la UI
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Shampoo? seleccionat;

  @override
  Widget build(BuildContext context) {
    // Se obtiene el provider
    final prov = Provider.of<ShampooProvider>(context);

    // Mantener la selección al volver de Page2
    seleccionat = prov.seleccionat;

    return Scaffold(
      appBar: AppBar(title: const Text("Shampoo App")),

      // CENTRAMOS EL CONTENIDO
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min, // evitamos ocupar toda la pantalla
            children: [

              // Selector de shampoo
              DropdownMenu<Shampoo>(
                initialSelection: seleccionat, // mantiene la selección
                hintText: "Selecciona un shampoo",
                dropdownMenuEntries: shampus
                    .map(
                      (s) => DropdownMenuEntry<Shampoo>(//el dropdownmenuentry es cada opcion del menu desplegable.
                        value: s,
                        label: s.marca,
                      ),
                    )
                    .toList(),

                onSelected: (value) {//cuando se selecciona un shampoo
                  setState(() {
                    seleccionat = value;
                  });

                  if (value != null) prov.seleccionar(value);//esto es para seleccionar el shampoo en el provider
                },
              ),

              const SizedBox(height: 20),

              // Botón para ir a la segunda página
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
