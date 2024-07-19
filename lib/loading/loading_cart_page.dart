import 'package:flutter/material.dart';
import 'package:menu_app/components/app_bar.dart';
import 'package:menu_app/loading/loading_home_page.dart';

class LoadingCartPage extends StatelessWidget {
  const LoadingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            surfaceTintColor: Colors.white,
            title: Text(
              'Resumo do pedido',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            centerTitle: true,
            leading: Icon(
              Icons.history_rounded,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: ThemeChangeIcon(),
              ),
            ],
          ),
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
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
    );
  }
}
