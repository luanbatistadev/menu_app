import 'package:flutter/material.dart';
import 'package:menu_app/components/app_bar.dart';
import 'package:menu_app/loading/loading_home_page.dart';
import 'package:menu_app/models/shimmer.dart';

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
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return LoadingFoodCard();
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

class LoadingFoodCard extends StatelessWidget {
  const LoadingFoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ListTile(
        leading: Skeleton(
          hasShadow: false,
          height: 60,
          width: 60,
          borderR: 12,
        ),
        title: Row(
          children: [
            Skeleton(
              hasShadow: false,
              width: 260,
              height: 15,
              borderR: 12,
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Skeleton(
              hasShadow: false,
              width: 150,
              height: 15,
              borderR: 12,
            ),
          ],
        ),
      ),
    );
  }
}
