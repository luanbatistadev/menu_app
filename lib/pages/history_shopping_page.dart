import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:menu_app/models/cart.dart';

class HistoryShoppingPage extends StatefulWidget {
  const HistoryShoppingPage({super.key});

  @override
  State<HistoryShoppingPage> createState() => _HistoryShoppingPageState();
}

class _HistoryShoppingPageState extends State<HistoryShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
                      'Histórico de pedidos',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    centerTitle: true,
                  ),
                  ValueListenableBuilder(
                    valueListenable: box.listenable(),
                    builder: (context, Box box, _) {
                      final list = loadCartHistory();

                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            if (index >= list.length) return null;

                            ShoppingCart cart = list[index];
                            var items = cart.userCart.entries.toList();

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: 0 == 0
                                  ? [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Pedido ${index + 1} dados: ',
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                      ),
                                      ...items.map((item) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(child: Text(item.key.name)),
                                              SizedBox(width: 10),
                                              Text('Qtd: ${item.value}'),
                                              SizedBox(width: 10),
                                              Text(
                                                'Total: R\$ ${(item.key.price * item.value).toStringAsFixed(2)}',
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ]
                                  : [],
                            );
                          },
                          childCount: list.length,
                        ),
                      );
                    },
                  ),
                  SliverToBoxAdapter(
                    child: ElevatedButton(
                      onPressed: () async {
                        await clearCartHistory();
                        showSnackBar('Histórico de pedidos limpo!');
                      },
                      child: Text('Limpar Histórico'),
                    ),
                  ),
                ],
              );
            }
          },
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
    final result = box.get('cartHistory') as List<Map<dynamic, dynamic>>;
    return result
        .map((e) => ShoppingCart.fromMap(e as Map<Map<String, dynamic>, dynamic>))
        .toList();
  }

  Future<void> clearCartHistory() async {
    var box = Hive.box('cartHistory');
    await box.clear();
  }
}
