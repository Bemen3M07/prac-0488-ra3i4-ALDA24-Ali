import 'package:flutter/material.dart';
import 'shampoo.dart';

class ShampooProvider extends ChangeNotifier {
  Shampoo? seleccionat;

  double quantitatInicial = 0.0;
  double quantitatQueda = 0.0;
  double quantitatGastada = 0.0;

  void seleccionar(Shampoo s) {
    seleccionat = s;
    quantitatInicial = s.quantitat * 1000; // convertir a ml
    quantitatQueda = quantitatInicial;
    quantitatGastada = 0;
    notifyListeners();
  }

  void restarDosi() {
    if (quantitatQueda > 0) {
      quantitatQueda -= 12;
      quantitatGastada = quantitatInicial - quantitatQueda;
      notifyListeners();
    }
  }

  bool esVermell() {
    return quantitatQueda < (quantitatInicial / 2);
  }
}
