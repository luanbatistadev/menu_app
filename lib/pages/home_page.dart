import "package:flutter/material.dart";
import "package:menu_app/models/foods.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Stack(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'lib/images/logo.png',
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
                Text(
                  'Chicken Republic',
                  style: TextStyle(
                    color: Color.fromARGB(255, 5, 12, 112),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right:5),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "ENG",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ]),
          leadingWidth: double.infinity,
          toolbarHeight: 30,
        ),
        body: Column(
          children: [
            Container(
                height: 40,
                padding: const EdgeInsets.only(left: 12, right: 12),
                margin: const EdgeInsets.only(
                    left: 25, right: 25, top: 5, bottom: 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text('Search'),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 15, left: 25),
              child: Row(
                children: [
                  Text(
                    "Featured",
                    style: TextStyle(
                      color: Color.fromARGB(255, 5, 12, 112),
                      fontWeight: FontWeight.bold,
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
          ],
        ));
  }
}
