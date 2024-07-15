import 'package:flutter/material.dart';
import 'package:menu_app/components/app_bar.dart';
import 'package:menu_app/components/carousel_slider_home.dart';
import 'package:menu_app/components/grid_view.dart';
import 'package:menu_app/components/list_view.dart';
import 'package:menu_app/components/search_bar.dart';
import 'package:menu_app/models/filter_tabview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<String> filterNotifier = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            toolbarHeight: 94,
            surfaceTintColor: Colors.white,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leadingWidth: double.infinity,
            leading: Column(
              children: [
                AppBarHome(),
                SearchBarComponent(
                  filterNotifier: filterNotifier,
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: FilterTabView(tabController: _tabController),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Semantics(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 15, left: 25),
                      child: Row(
                        children: [
                          Text(
                            'Conheça:',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: CarroselFoodListView1(),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: ValueListenableBuilder(
          valueListenable: filterNotifier,
          builder: (context, filter, child) => TabBarView(
            controller: _tabController,
            clipBehavior: Clip.hardEdge,
            children: List.generate(
              6,
              (index) {
                if (screenSize < 480) {
                  return ListViewChicken(
                    filter: filter,
                  );
                } else {
                  return GridViewChicken(
                    filter: filter,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    filterNotifier.dispose();
    super.dispose();
  }
}
