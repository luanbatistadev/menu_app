import "package:flutter/material.dart";
import "package:menu_app/models/cart.dart";
import "package:menu_app/models/filter_tabview.dart";
import "package:menu_app/models/foods.dart";
import "package:menu_app/components/foods_tile.dart";
import "package:menu_app/components/list_view.dart";
import "package:provider/provider.dart";

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
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 6,
          initialIndex: 1,
          child: Column(
            children: [
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 12, right: 12),
                margin: const EdgeInsets.only(
                    left: 25, right: 25, top: 5, bottom: 0,),
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
                    Text('Search'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 15, left: 25),
                child: Row(
                  children: const [
                    Text(
                      "Featured",
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 12, 112),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                height: 120,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodslist.length,
                    itemBuilder: (BuildContext context, int index) {
                      Food food = foodslist[index];
                      return FoodsSimpleTile(food: food);
                    },
                  ),
                ),
              ),
              FilterTabView(),
              Expanded(
                child: TabBarView(
                  children: const [
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
    );
  }
}
