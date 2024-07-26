import 'package:flutter/material.dart';
import 'package:menu_app/models/foods.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
    required this.food,
    required this.quantity,
    required this.removeItemFromCart,
  });
  final Food food;
  final int quantity;
  final void Function(Food) removeItemFromCart;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final double priceAcumulator = widget.food.price * widget.quantity;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            widget.food.path,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: SizedBox(
          width: 120,
          child: Text(
            widget.food.name,
            softWrap: true,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        subtitle: Text(
          '${widget.quantity} x',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: SizedBox(
          width: 120,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'R\$${priceAcumulator.toStringAsFixed(2)}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                padding: EdgeInsets.all(1),
                onPressed: () {
                  widget.removeItemFromCart(widget.food);
                },
                icon: Icon(
                  Icons.delete_outline_rounded,
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
