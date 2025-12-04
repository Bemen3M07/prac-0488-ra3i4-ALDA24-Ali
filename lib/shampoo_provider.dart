import 'package:flutter/material.dart';
import 'shampoo.dart';

class ShampooProvider extends ChangeNotifier {
  Shampoo? seleccionat;

  double quantitatInicial = 0.0;
  double quantitatQueda = 0.0;
  double quantitatGastada = 0.0;

//aqui se selecciona el shampoo y se inicializan las cantidades:
  void seleccionar(Shampoo s) {
    seleccionat = s;
    quantitatInicial = s.quantitat * 1000; // convertir a mililiros
    quantitatQueda = quantitatInicial;
    quantitatGastada = 0;
    notifyListeners();
  }

  void restarDosi() {
    if (quantitatQueda > 0) {
      quantitatQueda -= 12;
      quantitatGastada = quantitatInicial - quantitatQueda;//aplicamos la resta.
      notifyListeners();
    }
  }

//aqui comprobamos si la cantidad que queda es menor a la mitad
  bool esVermell() {
    return quantitatQueda < (quantitatInicial / 2);
  }
}
