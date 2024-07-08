import 'package:flutter/material.dart';
import 'package:menu_app/models/cart.dart';
import 'package:menu_app/models/cart_item.dart';
import 'package:menu_app/models/foods.dart';
import 'package:menu_app/components/foods_tile.dart';
import 'package:provider/provider.dart';

class ListViewChicken extends StatefulWidget {
  const ListViewChicken({super.key});

  @override
  State<ListViewChicken> createState() => _ListViewChickenState();
}

class _ListViewChickenState extends State<ListViewChicken> {
  void addFoodToCart(Food food) {
    Provider.of<Cart>(context, listen: false).addItemToCart(food);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Succesfully added'),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: foodslist.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        Food food = foodslist[index];
        return FoodsFullTile(
          food: food,
          onTap: () => addFoodToCart(food),
        );
      },
    );
  }
}

class ListViewCart extends StatefulWidget {
  const ListViewCart({super.key});

  @override
  State<ListViewCart> createState() => _ListViewCartState();
}

class _ListViewCartState extends State<ListViewCart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        final cartItems = value.getUserCart().entries.toList();
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: cartItems.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final entry = cartItems[index];
            Food food = entry.key;
            int quantity = entry.value;
            return CartItem(food: food, quantity: quantity);
          },
        );
      },
    );
  }
}

class CarroselFoodListView extends StatelessWidget {
  const CarroselFoodListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: foodslist.length,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemBuilder: (BuildContext context, int index) {
        Food food = foodslist[index];
        return FoodsSimpleTile(food: food);
      },
    );
  }
}
