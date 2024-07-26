import 'package:flutter/material.dart';
import 'package:menu_app/loading/loading_home_page.dart';
import 'package:menu_app/models/shimmer.dart';

class LoadingSearchPage extends StatelessWidget {
  const LoadingSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Skeleton(
              hasShadow: false,
              width: double.infinity,
              height: 40,
              borderR: 8,
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 8),
            ),
            screenSize < 480
                ? SliverList.builder(
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return LoadingFoodTile();
                    },
                  )
                : SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisExtent: 250,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int index) {
                      return LoadingGridFood();
                    },
                  ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }
}
