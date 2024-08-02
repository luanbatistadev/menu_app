import 'package:flutter/material.dart';
import 'package:menu_app/components/grid_view.dart';
import 'package:menu_app/components/list_view.dart';

class TabBarViewHome extends StatefulWidget {
  const TabBarViewHome({
    Key? key,
    required this.screenSize,
    required this.tabController,
  }) : super(key: key);

  final double screenSize;
  final TabController tabController;

  @override
  State<TabBarViewHome> createState() => _TabBarViewHomeState();
}

class _TabBarViewHomeState extends State<TabBarViewHome> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      clipBehavior: Clip.hardEdge,
      children: List.generate(
        6,
        (index) {
          if (widget.screenSize < 480) {
            return buildTabPage(ListViewChicken(filter: ''));
          } else {
            return buildTabPage(GridViewChicken(filter: ''));
          }
        },
      ),
    );
  }

  Widget buildTabPage(Widget child) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification.metrics.extentAfter == 0) {
          int currentIndex = widget.tabController.index;
          if (currentIndex < widget.tabController.length - 1) {
            widget.tabController.animateTo(currentIndex + 1);
          }
        }
        return false;
      },
      child: child,
    );
  }
}