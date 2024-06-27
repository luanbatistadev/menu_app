
class Food {
  final double price;
  final String name;
  final String path;
  final String description;

  Food({
    required this.price,
    required this.name,
    required this.path,
    required this.description,
  });
}

List<Food> foodslist = [
  Food(
    name: "Frango Grelhado",
    price: 12.50,
    description: "Frango grelhado temperado com ervas frescas.",
    path: 'lib/images/FRANGO1.png',
  ),
  Food(
    name: "Frango à Parmegiana",
    price: 15.00,
    description: "Peito de frango empanado com molho",
    path: 'lib/images/FRANGO2.png',
  ),
  Food(
    name: "Frango com Batatas",
    price: 18.50,
    description: "Frango assado com batatas temperadas.",
    path: 'lib/images/FRANGO3.png',
  ),
  Food(
    name: "Frango à Milanesa",
    price: 10.00,
    description: "Filé de frango empanado e frito.",
    path: 'lib/images/FRANGO4.png',
  ),
  Food(
    name: "Frango Xadrez",
    price: 22.50,
    description: "Frango salteado com legumes e molho especial.",
    path: 'lib/images/FRANGO5.png',
  ),
  Food(
    name: "Salada de Frango",
    price: 16.00,
    description: "Salada fresca com peito de frango grelhado.",
    path: 'lib/images/FRANGO6.png',
  ),
  Food(
    name: "Coxinha de Frango",
    price: 8.50,
    description: "Coxinha de frango assada com massa crocante.",
    path: 'lib/images/FRANGO7.png',
  ),
  Food(
    name: "Frango ao Curry",
    price: 14.50,
    description: "Frango cozido com molho de curry e arroz.",
    path: 'lib/images/FRANGO8.png',
  ),
  Food(
    name: "Frango Teriyaki",
    price: 19.00,
    description: "Frango grelhado com molho teriyaki e legumes.",
    path: 'lib/images/FRANGO9.png',
  ),
  Food(
    name: "Sopa de Frango",
    price: 3.50,
    description: "Sopa quente com pedaços de frango e legumes.",
    path: 'lib/images/FRANGO10.png',
  ),
];
