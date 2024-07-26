import 'dart:async';

import 'package:flutter/material.dart';
import 'package:menu_app/components/foods_tile.dart';
import 'package:menu_app/models/cart.dart';
import 'package:menu_app/models/foods.dart';
import 'package:provider/provider.dart';

class GridViewChicken extends StatefulWidget {
  const GridViewChicken({super.key, required this.filter});
  final String filter;

  @override
  State<GridViewChicken> createState() => _GridViewChickenState();
}

class _GridViewChickenState extends State<GridViewChicken> {
  Timer _debounce = Timer(Duration(milliseconds: 500), () {});
  void addFoodToCart(Food food) {
    Provider.of<Cart>(context, listen: false).addItemToCart(food);

    if (_debounce.isActive) _debounce.cancel();
    _debounce = Timer(Duration(milliseconds: 1000), () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Adicionado ao carrinho 🥰🙏🏾'),
          duration: Duration(seconds: 1),
        ),
      );
    });
  }

  void removeFoodFromCart(Food food) {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = foodsList
        .where(
          (item) => item.name.toLowerCase().contains(widget.filter.toLowerCase()),
        )
        .toList();
    if (filteredItems.isEmpty) {
      return Center(
        child: Text(
          'Nenhum produto encontrado vida 😔',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomScrollView(
          restorationId: 'GRID VIEW PRODUCTS',
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 8),
            ),
            SliverGrid.builder(
              itemCount: filteredItems.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisExtent: 250,
                crossAxisSpacing: 0,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                Food food = filteredItems[index];
                return FoodsTileGrid(
                  food: food,
                  onTapPlus: () => addFoodToCart(food),
                  onTapLess: () => removeFoodFromCart(food),
                );
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      );
    }
  }
}
