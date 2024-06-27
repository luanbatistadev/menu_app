import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_app/components/list_view.dart';
import 'package:menu_app/models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isCard = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 12, 112),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  'Order Summary',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: ListViewCart(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 15),
                child: Row(
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      size: 35,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'City, State - Country',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          child: Text(
                            'Delivery Address',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  'Payment Summary',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.wallet_giftcard_sharp,
                      size: 25,
                    ),
                    Text(
                      'Use a Promo code',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 40,
                  top: 15,
                  bottom: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal'),
                    Text(
                      'R\$ ${value.getTotalPrice().toStringAsFixed(2)}',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 40,
                  top: 0,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Service charge'),
                    Text(
                      'R\$ 12.0',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 40,
                  top: 0,
                  bottom: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'R\$ ${(value.getTotalPrice() + 12.0).toStringAsFixed(2)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  'Payment Method',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.credit_card),
                            Text('Pay with Card'),
                          ],
                        ),
                        Checkbox(
                          tristate: true,
                          value: !isCard,
                          onChanged: (bool? newValue) => {
                            setState(() {
                              isCard = !isCard;
                            }),
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(CupertinoIcons.money_dollar_circle),
                            Text('Pay with Card'),
                          ],
                        ),
                        Checkbox(
                          tristate: true,
                          value: isCard,
                          onChanged: (bool? newValue) => {
                            setState(() {
                              isCard = newValue!;
                            }),
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
