import "package:flutter/material.dart";
import "package:menu_app/components/app_bar.dart";
import "package:menu_app/components/bottom_nav_bar.dart";
import "package:menu_app/models/filter_button.dart";
import "package:menu_app/models/filter_tabview.dart";
import "package:menu_app/models/foods.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarHome(),
      body: DefaultTabController(
        length: 6,
        initialIndex: 1,
        child: Column(
          children: [
            Container(
              height: 40,
              padding: const EdgeInsets.only(left: 12, right: 12),
              margin:
                  const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 0),
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
            Container(
              height: 30,
              margin: EdgeInsets.only(left: 25),
              child: TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Color.fromARGB(255, 5, 12, 112),
                labelColor: Color.fromARGB(255, 5, 12, 112),
                automaticIndicatorColorAdjustment: true,
                padding: EdgeInsets.all(2),
                tabs: [
                  Tab(
                    child: Container(
                      width: 80,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Food",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 80,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Protein",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 80,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Swallow",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 80,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Soups",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 80,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Drinks",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 80,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Fried",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
            /*Expanded(
              child: ListView.builder(
                itemCount: foodslist.length,
                itemBuilder: (BuildContext context, int index) {
                  Food food = foodslist[index];
                  return FoodsFullTile(food: food);
                },
              ),
            ),*/
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarHome(),
    );
  }
}
