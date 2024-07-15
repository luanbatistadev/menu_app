import 'package:flutter/material.dart';
import 'package:menu_app/utils/filters.dart';

class FilterTabView extends StatelessWidget {
  const FilterTabView({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        automaticIndicatorColorAdjustment: true,
        padding: EdgeInsets.symmetric(horizontal: 20),
        labelPadding: EdgeInsets.only(
          right: 2,
          left: 0,
          top: 2,
          bottom: 2,
        ),
        tabAlignment: TabAlignment.center,
        tabs: kFilters.map(
          (filter) {
            return Tab(
              child: SizedBox(
                width: 80,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    filter,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
