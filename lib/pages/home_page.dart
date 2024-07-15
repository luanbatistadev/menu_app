import 'package:flutter/material.dart';
import 'package:menu_app/components/app_bar.dart';
import 'package:menu_app/components/carousel_slider_home.dart';
import 'package:menu_app/components/grid_view.dart';
import 'package:menu_app/components/list_view.dart';
import 'package:menu_app/models/filter_tabview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 230,
              pinned: true,
              toolbarHeight: 38,
              surfaceTintColor: Colors.white,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leadingWidth: double.infinity,
              leading: Column(
                children: [
                  AppBarHome(),
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
                      height: 30,
                    ),
                    Semantics(
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 10, bottom: 15, left: 25),
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
          body: TabBarView(
            controller: _tabController,
            clipBehavior: Clip.hardEdge,
            children: List.generate(
              6,
              (index) {
                if (screenSize < 480) {
                  return ListViewChicken(
                    filter: '',
                  );
                } else {
                  return GridViewChicken(
                    filter: '',
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
    super.dispose();
  }
}
