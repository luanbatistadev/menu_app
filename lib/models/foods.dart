// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Food {
  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.path,
  });
  final int id;
  final String name;
  final double price;
  final String description;
  final String path;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'path': path,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as double,
      description: map['description'] as String,
      path: map['path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<Food> foodsList = [
  Food(
    id: 1,
    name: 'Frango Grelhado',
    price: 12.50,
    description: 'Frango grelhado temperado com ervas frescas.',
    path: 'lib/images/FRANGO1.png',
  ),
  Food(
    id: 2,
    name: 'Frango à Parmegiana',
    price: 15.25,
    description: 'Peito de frango empanado com molho',
    path: 'lib/images/FRANGO2.png',
  ),
  Food(
    id: 3,
    name: 'Frango com Batatas',
    price: 18.50,
    description: 'Frango assado com batatas temperadas.',
    path: 'lib/images/FRANGO3.png',
  ),
  Food(
    id: 4,
    name: 'Frango à Milanesa',
    price: 10.85,
    description: 'Filé de frango empanado e frito.',
    path: 'lib/images/FRANGO4.png',
  ),
  Food(
    id: 5,
    name: 'Frango Xadrez',
    price: 22.75,
    description: 'Frango salteado com legumes e molho especial.',
    path: 'lib/images/FRANGO5.png',
  ),
  Food(
    id: 6,
    name: 'Salada de Frango',
    price: 16.00,
    description: 'Salada fresca com peito de frango grelhado.',
    path: 'lib/images/FRANGO6.png',
  ),
  Food(
    id: 7,
    name: 'Coxinha de Frango',
    price: 8.50,
    description: 'Coxinha de frango assada com massa crocante.',
    path: 'lib/images/FRANGO7.png',
  ),
  Food(
    id: 8,
    name: 'Frango ao Curry',
    price: 14.50,
    description: 'Frango cozido com molho de curry e arroz.',
    path: 'lib/images/FRANGO8.png',
  ),
  Food(
    id: 9,
    name: 'Frango Teriyaki',
    price: 19.00,
    description: 'Frango grelhado com molho teriyaki e legumes.',
    path: 'lib/images/FRANGO9.png',
  ),
  Food(
    id: 10,
    name: 'Sopa de Frango',
    price: 3.50,
    description: 'Sopa quente com pedaços de frango e legumes.',
    path: 'lib/images/FRANGO10.png',
  ),
  Food(
    id: 11,
    name: 'Sopa de Legumes',
    price: 3.50,
    description: 'Sopa quente com uma mistura de legumes frescos.',
    path: 'lib/images/FRANGO2.png',
  ),
  Food(
    id: 12,
    name: 'Caldo de Frango',
    price: 3.50,
    description: 'Caldo nutritivo com pedaços de frango e ervas.',
    path: 'lib/images/FRANGO9.png',
  ),
  Food(
    id: 13,
    name: 'Sopa de Milho',
    price: 3.50,
    description: 'Sopa cremosa de milho com temperos suaves.',
    path: 'lib/images/FRANGO3.png',
  ),
  Food(
    id: 14,
    name: 'Creme de Abóbora',
    price: 3.50,
    description: 'Creme de abóbora com um toque de gengibre.',
    path: 'lib/images/FRANGO7.png',
  ),
  Food(
    id: 15,
    name: 'Sopa de Tomate',
    price: 3.50,
    description: 'Sopa de tomate com manjericão e alho.',
    path: 'lib/images/FRANGO4.png',
  ),
  Food(
    id: 16,
    name: 'Canja de Galinha',
    price: 3.50,
    description: 'Canja de galinha com arroz e cenoura.',
    path: 'lib/images/FRANGO1.png',
  ),
  Food(
    id: 17,
    name: 'Caldo Verde',
    price: 3.50,
    description: 'Caldo verde com couve e pedaços de linguiça.',
    path: 'lib/images/FRANGO5.png',
  ),
  Food(
    id: 18,
    name: 'Sopa de Batata',
    price: 3.50,
    description: 'Sopa de batata com alho-poró e bacon.',
    path: 'lib/images/FRANGO8.png',
  ),
  Food(
    id: 19,
    name: 'Caldo de Feijão',
    price: 3.50,
    description: 'Caldo de feijão preto com pedaços de carne.',
    path: 'lib/images/FRANGO6.png',
  ),
  Food(
    id: 20,
    name: 'Creme de Ervilha',
    price: 3.50,
    description: 'Creme de ervilha com hortelã e limão.',
    path: 'lib/images/FRANGO10.png',
  ),
  Food(
    id: 21,
    name: 'Sopa de Cebola',
    price: 3.50,
    description: 'Sopa de cebola gratinada com queijo.',
    path: 'lib/images/FRANGO2.png',
  ),
  Food(
    id: 22,
    name: 'Sopa de Lentilha',
    price: 3.50,
    description: 'Sopa de lentilha com cenoura e batata-doce.',
    path: 'lib/images/FRANGO9.png',
  ),
  Food(
    id: 23,
    name: 'Sopa de Abóbora',
    price: 3.50,
    description: 'Sopa de abóbora com leite de coco e curry.',
    path: 'lib/images/FRANGO3.png',
  ),
  Food(
    id: 24,
    name: 'Caldo de Mandioquinha',
    price: 3.50,
    description: 'Caldo de mandioquinha com carne seca.',
    path: 'lib/images/FRANGO7.png',
  ),
  Food(
    id: 25,
    name: 'Sopa de Abobrinha',
    price: 3.50,
    description: 'Sopa de abobrinha com hortelã e iogurte.',
    path: 'lib/images/FRANGO4.png',
  ),
  Food(
    id: 26,
    name: 'Sopa de Espinafre',
    price: 3.50,
    description: 'Sopa de espinafre com alho e nozes.',
    path: 'lib/images/FRANGO1.png',
  ),
  Food(
    id: 27,
    name: 'Caldo de Cenoura',
    price: 3.50,
    description: 'Caldo de cenoura com gengibre e mel.',
    path: 'lib/images/FRANGO5.png',
  ),
  Food(
    id: 28,
    name: 'Creme de Batata-doce',
    price: 3.50,
    description: 'Creme de batata-doce com coco ralado.',
    path: 'lib/images/FRANGO8.png',
  ),
  Food(
    id: 29,
    name: 'Sopa de Ervilha',
    price: 3.50,
    description: 'Sopa de ervilha com presunto e hortelã.',
    path: 'lib/images/FRANGO6.png',
  ),
  Food(
    id: 30,
    name: 'Caldo de Peixe',
    price: 3.50,
    description: 'Caldo de peixe com mariscos e coentro.',
    path: 'lib/images/FRANGO10.png',
  ),
  Food(
    id: 31,
    name: 'Sopa de Beterraba',
    price: 3.50,
    description: 'Sopa de beterraba com iogurte natural.',
    path: 'lib/images/FRANGO2.png',
  ),
  Food(
    id: 32,
    name: 'Sopa de Grão-de-bico',
    price: 3.50,
    description: 'Sopa de grão-de-bico com espinafre.',
    path: 'lib/images/FRANGO9.png',
  ),
  Food(
    id: 33,
    name: 'Sopa de Inhame',
    price: 3.50,
    description: 'Sopa de inhame com alho e gengibre.',
    path: 'lib/images/FRANGO3.png',
  ),
  Food(
    id: 34,
    name: 'Caldo de Camarão',
    price: 3.50,
    description: 'Caldo de camarão com leite de coco e dendê.',
    path: 'lib/images/FRANGO7.png',
  ),
  Food(
    id: 35,
    name: 'Sopa de Nabo',
    price: 3.50,
    description: 'Sopa de nabo com frango desfiado.',
    path: 'lib/images/FRANGO4.png',
  ),
  Food(
    id: 36,
    name: 'Creme de Palmito',
    price: 3.50,
    description: 'Creme de palmito com queijo parmesão.',
    path: 'lib/images/FRANGO1.png',
  ),
  Food(
    id: 37,
    name: 'Sopa de Feijão Branco',
    price: 3.50,
    description: 'Sopa de feijão branco com linguiça.',
    path: 'lib/images/FRANGO5.png',
  ),
  Food(
    id: 38,
    name: 'Sopa de Macarrão',
    price: 3.50,
    description: 'Sopa de macarrão com legumes variados.',
    path: 'lib/images/FRANGO8.png',
  ),
  Food(
    id: 39,
    name: 'Caldo de Galinha',
    price: 3.50,
    description: 'Caldo de galinha com temperos caseiros.',
    path: 'lib/images/FRANGO6.png',
  ),
  Food(
    id: 40,
    name: 'Creme de Espinafre',
    price: 3.50,
    description: 'Creme de espinafre com queijo ralado.',
    path: 'lib/images/FRANGO10.png',
  ),
];
