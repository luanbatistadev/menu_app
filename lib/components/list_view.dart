import 'package:flutter/material.dart';
import 'package:menu_app/components/foods_tile.dart';
import 'package:menu_app/models/cart.dart';
import 'package:menu_app/models/cart_item.dart';
import 'package:menu_app/models/foods.dart';
import 'package:provider/provider.dart';

class ListViewFood extends StatefulWidget {
  const ListViewFood({
    Key? key,
    required this.filter,
    this.category,
  }) : super(key: key);
  final String filter;
  final String? category;

  @override
  State<ListViewFood> createState() => _ListViewFoodState();
}

class _ListViewFoodState extends State<ListViewFood> {
  void addFoodToCart(Food food) {
    Provider.of<Cart>(context, listen: false).addItemToCart(food);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Adicionado ao carrinho!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = foodsList.where((item) {
      final matchesFilter =
          item.name.toLowerCase().contains(widget.filter.toLowerCase());
      final matchesCategory =
          widget.category == null || item.category == widget.category;
      return matchesFilter && matchesCategory;
    }).toList();
    if (filteredItems.isEmpty) {
      return Center(
            child: Text(
              'Nenhum produto encontrado vida 😔',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
    } else {
      return CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: filteredItems.length,
                itemBuilder: (BuildContext context, int index) {
                  Food food = filteredItems[index];
                  return FoodsFullTile(
                    food: food,
                    onTap: () => addFoodToCart(food),
                  );
                },
              ),
            ],
          );
    }
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
        return SliverList.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final entry = cartItems[index];
            Food food = entry.key;
            int quantity = entry.value;
            return CartItem(
              food: food,
              quantity: quantity,
              removeItemFromCart: value.removeItemFromCart,
            );
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
      itemCount: foodsList.length,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemBuilder: (BuildContext context, int index) {
        Food food = foodsList[index];
        return FoodsSimpleTile(food: food);
      },
    );
  }
}
