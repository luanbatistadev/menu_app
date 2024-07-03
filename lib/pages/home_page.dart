import 'package:flutter/material.dart';
import 'package:menu_app/components/app_bar.dart';
import 'package:menu_app/components/list_view.dart';
import 'package:menu_app/models/cart.dart';
import 'package:menu_app/models/filter_tabview.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              title: AppBarHome(),
              expandedHeight: 60.0,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                margin: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 5,
                  bottom: 0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    Text('Pesquisa'),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 15, left: 25),
                child: Row(
                  children: const [
                    Text(
                      'Conheça:',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 12, 112),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                width: double.infinity,
                child: CarroselFoodListView(),
              ),
            ),
            SliverFillRemaining(
              child: DefaultTabController(
                length: 6,
                initialIndex: 1,
                child: Column(
                  children: const [
                    FilterTabView(),
                    Flexible(
                      fit: FlexFit.loose,
                      child: TabBarView(
                        children: [
                          ListViewChicken(),
                          ListViewChicken(),
                          ListViewChicken(),
                          ListViewChicken(),
                          ListViewChicken(),
                          ListViewChicken(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
