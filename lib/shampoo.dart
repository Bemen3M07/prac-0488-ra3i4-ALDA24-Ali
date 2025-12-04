class Shampoo {
  final String marca;
  final double quantitat;

  Shampoo({
    required this.marca,
    required this.quantitat,
  });
}

final List<Shampoo> shampus = [
  Shampoo(marca: 'Pantene', quantitat: 1.0),
  Shampoo(marca: 'Timotei', quantitat: 1.1),
  Shampoo(marca: 'H&S (H&S)', quantitat: 1.0),
  Shampoo(marca: 'Garnier Fructis', quantitat: 1.0),
  Shampoo(marca: 'L’Oréal Elvive', quantitat: 2.5),
  Shampoo(marca: 'Tresemmé', quantitat: 4.0),
  Shampoo(marca: 'Kérastase', quantitat: 4.0),
  Shampoo(marca: 'Wella Professionals', quantitat: 5.0),
];
