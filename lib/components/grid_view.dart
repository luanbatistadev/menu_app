import 'package:flutter/material.dart';
import 'package:menu_app/components/foods_tile.dart';
import 'package:menu_app/models/cart.dart';
import 'package:menu_app/models/foods.dart';
import 'package:provider/provider.dart';

class GridViewChicken extends StatefulWidget {
  const GridViewChicken({super.key});

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Scrollbar(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisExtent: 200,
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
