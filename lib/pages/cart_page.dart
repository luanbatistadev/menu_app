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
  String alarm = '';
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                title: Text(
                  'Resumo',
                  style: TextStyle(
                    color: Color.fromARGB(255, 5, 12, 112),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                centerTitle: true,
                leading: PreferredSize(
                  preferredSize: Size.fromHeight(kTextTabBarHeight),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 5,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'Detalhes do pedido',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  height: value.getCartLength() == 0 ? 100 : 400,
                  child: value.getCartLength() == 0
                      ? Center(child: Text('Carrinho vazio!'))
                      : ListViewCart(),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
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
                          'Vilhena, Rondônia - Brazil',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Endereço de entrega',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
