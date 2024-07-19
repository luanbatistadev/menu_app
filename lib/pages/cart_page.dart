import 'package:flutter/material.dart';
import 'package:menu_app/components/app_bar.dart';
import 'package:menu_app/loading/loading_cart_page.dart';
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
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();
  // ignore: unused_field
  late bool _isLoading;
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingCartPage()
        : Consumer<Cart>(
            builder: (context, value, child) => SafeArea(
              child: Scaffold(
                body: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: true,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      surfaceTintColor: Colors.white,
                      title: Text(
                        'Resumo do pedido',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      centerTitle: true,
                      leading: Icon(
                        Icons.history_rounded,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
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
                          final cartItems =
                              value.getUserCart().entries.toList();
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
                  ],
                ),
                bottomNavigationBar: AnimatedCrossFade(
                  duration: Duration(milliseconds: 300),
                  firstChild: Builder(
                    builder: (context) {
                      final theme = Theme.of(context);
                      return Container(
                        color: theme.colorScheme.primary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Text(
                                      '${value.getCartLength()}',
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          'R\$ ${value.getTotalPrice().toString().split('.')[0]}',
                                      style:
                                          theme.textTheme.bodyLarge?.copyWith(
                                        color:
                                            theme.colorScheme.primaryContainer,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: ','),
                                        TextSpan(
                                          text: value
                                              .getTotalPrice()
                                              .toStringAsFixed(2)
                                              .split('.')[1],
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                            color: theme
                                                .colorScheme.primaryContainer,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => confirmSale(),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                                  child: Row(
                                    children: [
                                      Text('Fazer pedido'),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Icon(
                                        Icons.check_circle_rounded,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  secondChild: SizedBox.shrink(),
                  crossFadeState: value.getCartLength() > 0
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
            ),
          );
  }

  void confirmSale() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          'Pedido confirmado! 😎',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
