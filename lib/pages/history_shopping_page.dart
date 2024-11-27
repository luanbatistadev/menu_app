import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:menu_app/loading/loading_history_shopping_page.dart';
import 'package:menu_app/main.dart';
import 'package:menu_app/models/cart.dart';

class HistoryShoppingPage extends StatefulWidget {
  const HistoryShoppingPage({super.key});

  @override
  State<HistoryShoppingPage> createState() => _HistoryShoppingPageState();
}

class _HistoryShoppingPageState extends State<HistoryShoppingPage> {
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();
      late bool _isLoading;
  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = true;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return _isLoading ? LoadingHistoryShoppingPage() : SafeArea(
      child: ThemeWidgetTest(
        child: Scaffold(
          body: FutureBuilder(
            future: Hive.openBox('cartHistory'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro ao abrir a box'));
              } else {
                var box = Hive.box('cartHistory');
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      title: Text(
                        'Histórico de pedidos ⏳',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      iconTheme: IconThemeData(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      centerTitle: true,
                      actions: [
                        PopupMenuButton(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: GestureDetector(
                                onTap: () async {
                                  await clearCartHistory();
                                  showSnackBar(
                                      'Histórico de pedidos limpo! 😄',);
                                },
                                child: Text('Limpar Histórico '),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ValueListenableBuilder(
                      valueListenable: box.listenable(),
                      builder: (context, Box box, _) {
                        final list = loadCartHistory();
                        if (list.isEmpty) {
                          return SliverFillRemaining(
                            child: Center(
                              child: Text('nenhum pedido registrado!'),
                            ),
                          );
                        } else {
                          return SliverAnimatedList(
                            itemBuilder: (context, index, animation) {
                              if (index >= list.length) {
                                return SizedBox.shrink();
                              }

                              ShoppingCart cart = list[index];
                              var items = cart.userCart.entries.toList();
                              var total = cart.userCart.entries.fold(0.0,
                                  (total, entry) {
                                return total + (entry.key.price * entry.value);
                              });

                              return Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: 0 == 0
                                      ? [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: Text(
                                              'Pedido ${index + 1}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                          ),
                                          ...items.map((item) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 4.0,
                                                horizontal: 10,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text('${item.value}x'),
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child: Text(item.key.name),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    'R\$ ${(item.key.price * item.value).toStringAsFixed(2)}',
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              border: Border.all(
                                                color: Colors.transparent,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(8.0),
                                                bottomRight:
                                                    Radius.circular(8.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Total:',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          color: Theme.of(
                                                            context,
                                                          )
                                                              .colorScheme
                                                              .primaryContainer,
                                                        ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'R\$ $total',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          color: Theme.of(
                                                            context,
                                                          )
                                                              .colorScheme
                                                              .primaryContainer,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]
                                      : [],
                                ),
                              );
                            },
                            initialItemCount: list.length,
                            key: _listKey,
                          );
                        }
                      },
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 12,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  List<ShoppingCart> loadCartHistory() {
    var box = Hive.box('cartHistory');
    final result = box.get('cartHistory') as List<Map<dynamic, dynamic>>?;
    if (result == null) {
      return [];
    }
    return result
        .map(
          (e) => ShoppingCart.fromMap(e as Map<Map<String, dynamic>, dynamic>),
        )
        .toList();
  }

  Future<void> clearCartHistory() async {
    var box = Hive.box('cartHistory');
    await box.clear();
  }
}
