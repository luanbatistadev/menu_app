import 'package:flutter/material.dart';
import 'package:menu_app/models/foods.dart';

class FoodsSimpleTile extends StatefulWidget {
  const FoodsSimpleTile({
    super.key,
    required this.food,
  });
  final Food food;

  @override
  State<FoodsSimpleTile> createState() => _FoodsSimpleTileState();
}

class _FoodsSimpleTileState extends State<FoodsSimpleTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 50,
      width: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          widget.food.path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FoodsFullTile extends StatelessWidget {
  const FoodsFullTile({super.key, required this.food, required this.onTap});
  final Food food;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25, left: 25, bottom: 10, top: 10),
      height: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
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
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 4,
                      left: 8,
                      top: 8,
                      bottom: 4,
                    ),
                    child: Text(
                      food.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 4,
                      left: 8,
                      top: 2,
                      bottom: 4,
                    ),
                    child: Text(
                      food.description,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 4,
                      left: 8,
                      bottom: 4,
                    ),
                    child: Text(
                      'R\$ ${food.price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Hero(
                  tag: 'food ${food.name}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      food.path,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                          255,
                          5,
                          12,
                          112,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
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
    );
  }
}

class FoodsTileGrid extends StatefulWidget {
  const FoodsTileGrid({
    super.key,
    required this.food,
    required this.onTapPlus,
    this.onTapLess,
  });
  final Food food;
  final void Function()? onTapPlus;
  final void Function()? onTapLess;

  @override
  State<FoodsTileGrid> createState() => _FoodsTileGridState();
}

class _FoodsTileGridState extends State<FoodsTileGrid> {
  int count = 0;

  void _incrementCount() {
    setState(() {
      count++;
    });
    if (widget.onTapPlus != null) widget.onTapPlus!();
  }

  void _decrementCount() {
    if (count > 0) {
      setState(() {
        count--;
      });
      if (widget.onTapLess != null) widget.onTapLess!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 5),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 90,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                widget.food.path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                widget.food.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.food.description,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'R\$ ${widget.food.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              GestureDetector(
                onTap: _incrementCount,
                child: Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 5, 12, 112),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text('$count'),
              ),
              GestureDetector(
                onTap: _decrementCount,
                child: Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 5, 12, 112),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.remove, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
