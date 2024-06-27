import 'package:flutter/material.dart';

class FilterTabView extends StatelessWidget {
  const FilterTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(left: 25, top: 2, bottom: 2),
      child: TabBar(
        isScrollable: true,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelColor: Color.fromARGB(255, 5, 12, 112),
        automaticIndicatorColorAdjustment: true,
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.only(
          right: 2,
          left: 0,
          top: 2,
          bottom: 2,
        ),
        tabAlignment: TabAlignment.start,
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
        ],
      ),
    );
  }
}
