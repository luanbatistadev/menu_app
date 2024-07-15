import 'package:flutter/material.dart';
import 'package:menu_app/components/app_bar.dart';
import 'package:menu_app/models/cart.dart';
import 'package:menu_app/models/cart_item.dart';
import 'package:menu_app/models/foods.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isCard = true;
  final GlobalKey<SliverAnimatedListState> _listKey = GlobalKey<SliverAnimatedListState>();
  
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              surfaceTintColor: Colors.white,
              title: Text(
                'Resumo do pedido',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              centerTitle: true,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: ThemeChangeIcon(),
                ),
              ],
            ),
            if (value.getCartLength() == 0)
              SliverFillRemaining(
                hasScrollBody: false,
                child: SizedBox(
                  height: value.getCartLength() == 0 ? 100 : 400,
                  child: Center(
                    child: Text(
                      'Carrinho vazio 😔'
                      '\nAdicione itens ao carrinho 🙏🏾',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            else
              Consumer<Cart>(
                builder: (context, value, child) {
                  final cartItems = value.getUserCart().entries.toList();
                  return SliverAnimatedList(
                    initialItemCount: cartItems.length,
                    key: _listKey,
                    itemBuilder: (context, index, animation) {
                      final entry = cartItems[index];
                      Food food = entry.key;
                      int quantity = entry.value;
                      return SizeTransition(
                        sizeFactor: animation,
                        child: CartItem(
                          food: food,
                          quantity: quantity,
                          removeItemFromCart: (p0) {
                            value.removeItemFromCart(p0);
                            if (!value.hasItemInCart(food)) {
                              _listKey.currentState!.removeItem(
                                index,
                                (context, animation) => SizeTransition(
                                  sizeFactor: animation,
                                  child: CartItem(
                                    food: food,
                                    quantity: quantity,
                                    removeItemFromCart: (p0) {},
                                  ),
                                ),
                                duration: Duration(milliseconds: 150),
                              );
                            }
                          },
                        ),
                      );
                    },
                  );
                },
              ),

            /* 
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(
                    'Detalhes de pagamento',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.wallet_giftcard_sharp,
                        size: 25,
                      ),
                      Text(
                        'Código promocional',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal'),
                      Text(
                        'R\$ ${value.getTotalPrice().toStringAsFixed(2)}',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Taxa de serviço'),
                      Text(
                        'R\$ 12.0',
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
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
                  Text(
                    'Método de pagamento',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.credit_card),
                              Text('Pagamento no Cartão'),
                            ],
                          ),
                          Checkbox(
                            activeColor: Color.fromARGB(255, 5, 12, 112),
                            shape: CircleBorder(),
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
                              Text('Pagamento no Dinheiro'),
                            ],
                          ),
                          Checkbox(
                            activeColor: Color.fromARGB(255, 5, 12, 112),
                            shape: CircleBorder(),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(
                          'Adicionar lembrete',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        'Opcional',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.notifications_none),
                              Text('Notificar às 8h (Café da manhã)'),
                            ],
                          ),
                          Checkbox(
                            activeColor: Color.fromARGB(255, 5, 12, 112),
                            shape: CircleBorder(),
                            tristate: true,
                            value: alarm == '8am',
                            onChanged: (bool? newValue) => {
                              setState(() {
                                alarm = (newValue == true) ? '8am' : '';
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
                              Icon(Icons.notifications_none),
                              Text('Notificar às 14h (Almoço)'),
                            ],
                          ),
                          Checkbox(
                            activeColor: Color.fromARGB(255, 5, 12, 112),
                            shape: CircleBorder(),
                            tristate: true,
                            value: alarm == '2pm',
                            onChanged: (bool? newValue) => {
                              setState(() {
                                alarm = (newValue == true) ? '2pm' : '';
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
                              Icon(Icons.notifications_none),
                              Text('Notificar às 17h (Jantar)'),
                            ],
                          ),
                          Checkbox(
                            activeColor: Color.fromARGB(255, 5, 12, 112),
                            shape: CircleBorder(),
                            tristate: true,
                            value: alarm == '5pm',
                            onChanged: (bool? newValue) => {
                              setState(() {
                                alarm = (newValue == true) ? '5pm' : '';
                              }),
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 30, right: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color.fromARGB(255, 5, 12, 112),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
           */
          ],
        ),
      ),
    );
  }
}
