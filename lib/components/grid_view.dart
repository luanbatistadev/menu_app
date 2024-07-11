import 'package:flutter/material.dart';
import 'package:menu_app/components/foods_tile.dart';
import 'package:menu_app/models/cart.dart';
import 'package:menu_app/models/foods.dart';
import 'package:provider/provider.dart';

class GridViewChicken extends StatefulWidget {
  final String filter;
  const GridViewChicken({super.key, required this.filter});

  @override
  State<GridViewChicken> createState() => _GridViewChickenState();
}

class _GridViewChickenState extends State<GridViewChicken> {
  void addFoodToCart(Food food) {
    Provider.of<Cart>(context, listen: false).addItemToCart(food);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added to cart'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = foodslist
        .where(
          (item) =>
              item.name.toLowerCase().contains(widget.filter.toLowerCase()),
        )
        .toList();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: filteredItems.isEmpty
          ? Center(
              child: Text(
                'No items match your filter.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Scrollbar(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisExtent: 250,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      Food food = foodslist[index];
                      return FoodsTileGrid(
                        food: food,
                        onTap: () => addFoodToCart(food),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
