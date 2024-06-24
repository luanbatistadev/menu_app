import 'package:flutter/material.dart';

class FilterTabview extends StatelessWidget {
  const FilterTabview({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        tabs: const [
          Tab(
            child: SizedBox(
              width: 80,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Food",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 80,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Protein",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 80,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Swallow",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 80,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Soups",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 80,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Drinks",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 80,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Fried",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
      ],);
  }
}
