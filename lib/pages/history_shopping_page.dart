import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:menu_app/models/cart.dart';

class HistoryShoppingPage extends StatelessWidget {
  const HistoryShoppingPage({super.key});

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
                      List<dynamic> cartHistory = box.get(
                        'cartHistory',
                        defaultValue: [],
                      );

                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            if (index >= cartHistory.length) return null;

                            ShoppingCart cart = cartHistory[index];
                            var items = cart.userCart.entries.toList();

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: 0 == 0 ? [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Pedido ${index + 1} dados: ',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
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
                              ] : []
                            );
                          },
                          childCount: cartHistory.length,
                        ),
                      );
                    },
                  ),
                  SliverToBoxAdapter(
                    child: ElevatedButton(
                      onPressed: () async {
                        await clearCartHistory();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Histórico de pedidos limpo!'),),
                        );
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
  Future<void> clearCartHistory() async {
  var box = Hive.box('cartHistory');
  await box.clear(); 
}
}
