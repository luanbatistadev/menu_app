import 'package:flutter/material.dart';
import 'package:menu_app/models/cart.dart';
import 'package:menu_app/models/foods.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Food food;
  final int quantity;
  const CartItem({super.key, required this.food, required this.quantity});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeFoodFromCart(Food food) {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.food);
  }

  @override
  Widget build(BuildContext context) {
    final double priceAcumulator = widget.food.price * widget.quantity;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ListTile(
        leading: ClipOval(
          child: Image.asset(
            widget.food.path,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        // ignore: sized_box_for_whitespace
        title: Container(width:120 ,child: Text(widget.food.name, softWrap: true,)),
        subtitle: Text(
          '${widget.quantity} x',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        // ignore: sized_box_for_whitespace
        trailing: Container(
          width: 120,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'R\$${priceAcumulator.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              IconButton(
                padding: EdgeInsets.all(1),
                onPressed: () => removeFoodFromCart(widget.food),
                icon: Icon(                  
                  Icons.delete_outline,
                  color: Colors.red[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}